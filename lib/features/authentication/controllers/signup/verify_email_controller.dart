import 'dart:async';

import 'package:e_commerce/data/repositories/authentication_repository.dart';
import 'package:e_commerce/utils/popups/snackbar_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/screens/success_screen.dart';
import '../../../../utils/constants/images.dart';
import '../../../../utils/constants/texts.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  Future<void> sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      USnackBarHelpers.successSnackBar(
        title: 'Email Send',
        message: 'Please Check Your Inbox',
      );
    } catch (e) {
      USnackBarHelpers.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  void setTimerForAutoRedirect() {
    Timer.periodic(Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser!.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(
          () => SuccessScreen(
            title: UTexts.yourAccountCreatedTitle,
            subtitle: UTexts.yourAccountCreatedSubTitle,
            image: UImages.success,
            onTap: () => AuthenticationRepository.instance.screenRedirect(),
          ),
        ); // SuccessScreen
      }
    }); // Timer-periodic
  }

  Future<void> checkEmailVerificationStatus() async {
    try {
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null && currentUser.emailVerified) {
        Get.off(
          () => SuccessScreen(
            title: UTexts.yourAccountCreatedTitle,
            subtitle: UTexts.yourAccountCreatedSubTitle,
            image: UImages.success,
            onTap: () => AuthenticationRepository.instance.screenRedirect(),
          ),
        );
      }
    } catch (e) {}
  }
}
