import 'package:flutter/material.dart';

import '../../../utils/constants/images.dart';
import '../../../utils/constants/sizes.dart';

class USocialButton extends StatelessWidget {
  const USocialButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildButton(UImages.facebook, () {}),
        SizedBox(width: USizes.spaceBtwItems),
        buildButton(UImages.google, () {}),
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
