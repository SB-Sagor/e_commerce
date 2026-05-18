import 'package:e_commerce/common/style/padding.dart';
import 'package:e_commerce/common/widgets/button/elevated_button.dart';
import 'package:e_commerce/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:e_commerce/features/authentication/screens/forget_password/reset_password.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/texts.dart';
import 'package:e_commerce/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:iconsax/iconsax.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: UPadding.screenPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                UTexts.forgetPasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(height: USizes.spaceBtwItems / 2),
              Text(
                UTexts.forgetPasswordSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              SizedBox(height: USizes.spaceBtwSections * 2),
              Column(
                children: [
                  Form(
                    key: controller.forgetPasswordFormKey,
                    child: TextFormField(
                      validator: (value) => UValidator.validateEmail(value),
                      controller: controller.email,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Iconsax.direct_right),
                        labelText: UTexts.email,
                      ),
                    ),
                  ),
                  SizedBox(height: USizes.spaceBtwItems),
                  UElevatedButton(
                    onPressed: () => controller.sendPasswordResetEmail(),
                    // Get.to(() => ResetPasswordScreen()),
                    child: Text(UTexts.submit),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
