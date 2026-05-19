import 'dart:io';

import 'package:e_commerce/data/repositories/authentication_repository.dart';
import 'package:e_commerce/data/repositories/user/user_repository.dart';
import 'package:e_commerce/features/authentication/models/user_model.dart';
import 'package:e_commerce/features/authentication/screens/login/login.dart';
import 'package:e_commerce/features/personalization/screens/edit_profile/widgets/re_authenticate_user_form.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/network_manager.dart';
import 'package:e_commerce/utils/popups/full_screen_loader.dart';
import 'package:e_commerce/utils/popups/snackbar_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart' as dio;

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final _userRepository = Get.put(UserRepository());
  Rx<UserModel> user = UserModel.empty().obs;
  RxBool profileLoading = false.obs;
  RxBool isProfileUploading = false.obs;

  /// Re-Authenticate Form Variables
  final email = TextEditingController();
  final password = TextEditingController();
  final reAuthFormKey = GlobalKey<FormState>();
  RxBool isPasswordVisible = false.obs;

  @override
  void onInit() {
    fetchUserDetails();
    super.onInit();
  }

  Future<void> saveUserRecord(UserCredential userCredential) async {
    try {
      await fetchUserDetails();

      if (user.value.id.isEmpty) {
        // Convert Full Name to FirstName & LastName
        final nameParts = UserModel.nameParts(userCredential.user!.displayName);
        final username = '${userCredential.user!.displayName}009';
        UserModel userModel = UserModel(
          id: userCredential.user!.uid,
          firstName: nameParts[0],
          // Unknown
          lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
          username: username,
          email: userCredential.user!.email ?? '',
          phoneNumber: userCredential.user!.phoneNumber ?? '',
          profilePicture: userCredential.user!.photoURL ?? '',
        );
        await _userRepository.saveUserRecord(userModel);
      }
    } catch (e) {
      USnackBarHelpers.errorSnackBar(title: 'Data Not Saved!');
    }
  }

  Future<void> fetchUserDetails() async {
    try {
      profileLoading.value = true;
      UserModel user = await _userRepository.fetchUserDetails();
      this.user.value = user;
      // this.user(user)
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  void deleteAccountWarningPopup() {
    Get.defaultDialog(
      contentPadding: EdgeInsets.all(USizes.md),
      title: 'Delete Account',
      middleText: 'Are you sure! You want to delete your account permanently',
      confirm: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          side: BorderSide(color: Colors.red),
        ),
        onPressed: () => deleteUserAccount(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: USizes.lg),
          child: Text('Delete'),
        ),
      ),
      cancel: OutlinedButton(
        onPressed: () => Get.back(),
        child: Text('Cancel'),
      ),
    );
  }

  Future<void> deleteUserAccount() async {
    try {
      UFullScreenLoader.openLoadingDialog('Processing', UImages.loading);

      final authRepository = AuthenticationRepository.instance;
      final provider = authRepository.currentUser!.providerData
          .map((e) => e.providerId)
          .first;

      if (provider == 'google.com') {
        await authRepository.signInWithGoogle();
        await authRepository.deleteAccount();
        UFullScreenLoader.stopLoading();
        USnackBarHelpers.successSnackBar(title: 'Account Deleted Successfully');

        Get.offAll(() => LoginScreen());
      } else if (provider == 'password') {
        UFullScreenLoader.stopLoading();
        USnackBarHelpers.successSnackBar(title: 'Account Deleted Successfully');

        Get.to(() => ReAuthenticationUserForm());
      }
    } catch (e) {
      UFullScreenLoader.stopLoading();
      USnackBarHelpers.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  Future<void> reAuthenticateUser() async {
    try {
      UFullScreenLoader.openLoadingDialog('Processing', UImages.loading);

      bool isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        UFullScreenLoader.stopLoading();
        return;
      }

      if (!reAuthFormKey.currentState!.validate()) {
        UFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance
          .reAuthenticateUserWithEmailAndPassword(
            email.text.trim(),
            password.text.trim(),
          );
      await AuthenticationRepository.instance.deleteAccount();

      UFullScreenLoader.stopLoading();

      Get.offAll(() => LoginScreen());
    } catch (e) {
      UFullScreenLoader.stopLoading();
      USnackBarHelpers.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  Future<void> updateUserProfilePicture() async {
    try {
      isProfileUploading.value = true;

      //pick image
      XFile? image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        maxHeight: 512,
        maxWidth: 512,
        imageQuality: 60,
      );
      if (image == null) return;

      // UFullScreenLoader.openLoadingDialog(
      //   'Uploading Profile Picture...',
      //   UImages.loading,
      // );
      //convert XFile to File
      File file = File(image.path);
      if (user.value.publicId.isNotEmpty) {
        await _userRepository.deleteProfilePicture(user.value.publicId);
      }

      dio.Response response = await _userRepository.uploadImage(file);

      // UFullScreenLoader.stopLoading();

      if (response.statusCode == 200) {
        // Get Data
        final data = response.data;
        final imageUrl = data['url'];
        final publicId = data['public_id'];
        // update profile picture from Fire store
        await _userRepository.updateSingleField({
          'ProfilePicture': imageUrl,
          'PublicId': publicId,
        });
        user.value.profilePicture = imageUrl;
        user.value.publicId = publicId;
        user.refresh();
        USnackBarHelpers.successSnackBar(
          title: 'Congratulation',
          message: 'Profile picture has been updated',
        );
      } else {
        throw 'Failed to upload profile picture. Please try again';
      }
    } catch (e) {
      USnackBarHelpers.errorSnackBar(title: 'Oh Snap', message: e.toString());
    } finally {
      isProfileUploading.value = false;
    }
  }
}
