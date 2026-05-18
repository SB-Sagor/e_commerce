import 'package:e_commerce/features/authentication/controllers/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

import '../../../utils/constants/images.dart';
import '../../../utils/constants/sizes.dart';

class USocialButton extends StatelessWidget {
  const USocialButton({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildButton(UImages.facebook, () {}),
        SizedBox(width: USizes.spaceBtwItems),
        buildButton(UImages.google, controller.googleSignIn),
      ],
    );
  }

  Container buildButton(String image, VoidCallback onPressed) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: Colors.grey),
      ),
      child: IconButton(onPressed: onPressed, icon: Image.asset(image)),
    );
  }
}
