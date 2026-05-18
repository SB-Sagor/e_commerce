import 'dart:math';

import 'package:e_commerce/data/repositories/authentication_repository.dart';
import 'package:e_commerce/features/personalization/controller/user_controller.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/keys.dart';
import 'package:e_commerce/utils/helpers/network_manager.dart';
import 'package:e_commerce/utils/popups/full_screen_loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../utils/popups/snackbar_helper.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  // Variables
  final _userController = Get.put(UserController());
  final email = TextEditingController();
  final password = TextEditingController();
  RxBool isPasswordVisible = false.obs;
  RxBool rememberMe = false.obs;
  final loginFormKey = GlobalKey<FormState>();
  final localStorage = GetStorage();

  @override
  void onInit() {
    email.text = localStorage.read(UKeys.rememberMeEmail) ?? '';
    // password.text = localStorage.read(UKeys.rememberMePassword) ?? '';
    super.onInit();
  }

  Future<void> loginWithEmailAndPassword() async {
    try {
      UFullScreenLoader.openLoadingDialog('Logging......', UImages.loading);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        UFullScreenLoader.stopLoading();
        USnackBarHelpers.warningSnackBar(title: 'No Internet Connection');
        return;
      }

      if (!loginFormKey.currentState!.validate()) {
        UFullScreenLoader.stopLoading();
        return;
      }

      if (rememberMe.value) {
        localStorage.write(UKeys.rememberMeEmail, email.text.trim());
        localStorage.write(UKeys.rememberMePassword, password.text.trim());
      }

      final userCredential = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      UFullScreenLoader.stopLoading();

      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      UFullScreenLoader.stopLoading();
      USnackBarHelpers.errorSnackBar(
        title: 'Login Failed',
        message: e.toString(),
      );
    }
  }

  Future<void> googleSignIn() async {
    try {
      // Start Loading
      UFullScreenLoader.openLoadingDialog('Logging....', UImages.loading);
      //network connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        UFullScreenLoader.stopLoading();
        USnackBarHelpers.warningSnackBar(title: 'No Internet Connection');
        return;
      }
      //google authentication
      UserCredential userCredential = await AuthenticationRepository.instance
          .signInWithGoogle();
      //save user record

      await _userController.saveUserRecord(userCredential);

      //stop loading
      UFullScreenLoader.stopLoading();
      //redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      //stop loading
      UFullScreenLoader.stopLoading();
      //error snack_bar
      USnackBarHelpers.errorSnackBar(
        title: 'Login Failed',
        message: e.toString(),
      );
    }
  }
}
