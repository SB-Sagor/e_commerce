import 'package:e_commerce/data/repositories/authentication_repository.dart';
import 'package:e_commerce/data/repositories/user/user_repository.dart';
import 'package:e_commerce/features/authentication/models/user_model.dart';
import 'package:e_commerce/features/authentication/screens/signup/verify_email.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:e_commerce/utils/helpers/network_manager.dart';
import 'package:e_commerce/utils/popups/full_screen_loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../utils/popups/snackbar_helper.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  final signUpKey = GlobalKey<FormState>();
  RxBool isPasswordVisible = false.obs;
  RxBool privacyPolicy = false.obs;

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final email = TextEditingController();
  final phoneNumber = TextEditingController();
  final password = TextEditingController();
  @override
  void onClose() {
    firstName.dispose();
    lastName.dispose();
    email.dispose();
    phoneNumber.dispose();
    password.dispose();
    super.onClose();
  }

  Future<void> registerUser() async {
    try {
      //start loading
      UFullScreenLoader.openLoadingDialog('Processing...', UImages.loading);
      //check internet connection
      bool isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        UFullScreenLoader.stopLoading();
        USnackBarHelpers.warningSnackBar(title: 'No Internet Connection');
        return;
      }

      //form validation

      if (!signUpKey.currentState!.validate()) {
        UFullScreenLoader.stopLoading();
        return;
      }
      //privacy policy
      if (!privacyPolicy.value) {
        UFullScreenLoader.stopLoading();
        USnackBarHelpers.warningSnackBar(
          title: 'Need to Accept Privacy Policy',
        );
        return;
      } //register the user
      UserCredential userCredential = await AuthenticationRepository.instance
          .registerUser(email.text.trim(), password.text.trim());
      //create user model
      UserModel userModel = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text,
        username: '${firstName.text}${DateTime.now().millisecondsSinceEpoch}',
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );
      //save user record
      final userRepository = Get.put(UserRepository());

      await userRepository.saveUserRecord(userModel);

      USnackBarHelpers.successSnackBar(
        title: 'Congratulations!',
        message: 'Account Created Successfully',
      );

      UFullScreenLoader.stopLoading();

      Get.to(() => VerifyEmailScreen(email: email.text));
    } catch (e) {
      UFullScreenLoader.stopLoading();

      USnackBarHelpers.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
