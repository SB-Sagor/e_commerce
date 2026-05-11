import 'package:e_commerce/common/style/padding.dart';
import 'package:e_commerce/common/widgets/button/elevated_button.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/texts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.onTap,
  });
  final String title, subtitle, image;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: UPadding.screenPadding,
          child: Column(
            children: [
              Lottie.asset(image),
              SizedBox(height: USizes.spaceBtwItems),
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),

              SizedBox(height: USizes.spaceBtwItems),
              Text(
                subtitle,
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: USizes.spaceBtwItems),
              UElevatedButton(onPressed: onTap, child: Text(UTexts.UContinue)),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    UTexts.resendEmail,
                    style: TextStyle(color: UColors.primary),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
