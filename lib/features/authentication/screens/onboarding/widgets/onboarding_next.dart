import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/button/elevated_button.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../controllers/onboarding/onboarding_controller.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    return Positioned(
      bottom: USizes.spaceBtwItems * 4,
      left: 0,
      right: 0,
      child: UElevatedButton(
        onPressed: controller.nextPage,
        child: Obx(
          () =>
              Text(controller.currentIndex.value == 2 ? 'Get Started' : 'Next'),
        ),
      ),
    );
  }
}
