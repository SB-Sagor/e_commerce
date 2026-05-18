import 'package:e_commerce/data/repositories/authentication_repository.dart';
import 'package:e_commerce/features/authentication/screens/forget_password/reset_password.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/images.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../../../utils/popups/snackbar_helper.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  final email = TextEditingController();
  final forgetPasswordFormKey = GlobalKey<FormState>();

  Future<void> sendPasswordResetEmail() async {
    try {
      AuthenticationRepository.instance.sendPasswordResetEmail(email.text);

      UFullScreenLoader.openLoadingDialog('Processing......', UImages.loading);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        UFullScreenLoader.stopLoading();
        USnackBarHelpers.warningSnackBar(title: 'No Internet Connection');
        return;
      }

      if (!forgetPasswordFormKey.currentState!.validate()) {
        UFullScreenLoader.stopLoading();
        return;
      }

      AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());

      UFullScreenLoader.stopLoading();

      USnackBarHelpers.successSnackBar(
        title: 'Email Sent',
        message: 'Email Link Sent to Reset Your Password',
      );

      Get.to(() => ResetPasswordScreen(email: email.text.trim(),));
    } catch (e) {
      UFullScreenLoader.stopLoading();
      USnackBarHelpers.errorSnackBar(title: 'Failed Forget Password',message: e.toString());
    }
  }

  Future<void> resendPasswordResetEmail() async {
    try {
      AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());

      UFullScreenLoader.openLoadingDialog('Processing......', UImages.loading);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        UFullScreenLoader.stopLoading();
        USnackBarHelpers.warningSnackBar(title: 'No Internet Connection');
        return;
      }


      AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());

      UFullScreenLoader.stopLoading();

      USnackBarHelpers.successSnackBar(
        title: 'Resend Email',
        message: 'Email Link Sent to Reset Your Password',
      );

    } catch (e) {
      UFullScreenLoader.stopLoading();
      USnackBarHelpers.errorSnackBar(title: 'Failed Forget Password',message: e.toString());
    }
  }
}
