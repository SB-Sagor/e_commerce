import 'package:e_commerce/features/authentication/screens/onboarding/widgets/onboarding_dot.dart';
import 'package:e_commerce/features/authentication/screens/onboarding/widgets/onboarding_next.dart';
import 'package:e_commerce/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:e_commerce/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:e_commerce/features/controllers/onboarding/onboarding_controller.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/texts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: USizes.defaultSpace),
        child: Stack(
          children: [
            PageView(
              controller: controller.pageController,
              onPageChanged: controller.updatePageIndicator,
              children: [
                OnBoardingPage(
                  animations: UImages.welcome,
                  title: UTexts.welcomeTitle,
                  subtitle: UTexts.welcomeSubTitle,
                ),
                OnBoardingPage(
                  animations: UImages.cart,
                  title: UTexts.cartTitle,
                  subtitle: UTexts.cartSubTitle,
                ),
                OnBoardingPage(
                  animations: UImages.delivery,
                  title: UTexts.deliveryTitle,
                  subtitle: UTexts.deliverySubTitle,
                ),
              ],
            ),
            OnBoardingDotNavigation(),
            OnBoardingNextButton(),
            OnBoardingSkipButton(),
          ],
        ),
      ),
    );
  }
}
