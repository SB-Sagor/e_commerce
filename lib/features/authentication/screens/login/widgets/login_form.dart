import 'package:e_commerce/features/authentication/controllers/login/login_controller.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/button/elevated_button.dart';
import '../../../../../navigation_menu.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/texts.dart';
import '../../forget_password/forget_password.dart';
import '../../signup/signup.dart';

class ULoginForm extends StatelessWidget {
  const ULoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = LoginController.instance;
    return Form(
      key: controller.loginFormKey,
      child: Column(
        children: [
          TextFormField(
            controller: controller.email,
            validator: (value) => UValidator.validateEmail(value),
            decoration: InputDecoration(
              prefixIcon: Icon(Iconsax.direct_right),
              labelText: UTexts.email,
            ),
            autofillHints: [AutofillHints.email],
          ),
          SizedBox(height: USizes.spaceBtwItems),
          Obx(
            () => TextFormField(
              controller: controller.password,
              validator: (value) =>
                  UValidator.validateEmptyText('Password', value),
              obscureText: !controller.isPasswordVisible.value,
              autofillHints: [AutofillHints.password],
              decoration: InputDecoration(
                prefixIcon: Icon(Iconsax.password_check),
                labelText: UTexts.password,
                suffixIcon: IconButton(
                  onPressed: () => controller.isPasswordVisible.toggle(),
                  icon: Icon(
                    controller.isPasswordVisible.value
                        ? Iconsax.eye
                        : Iconsax.eye_slash,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: USizes.spaceBtwInputFields / 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Obx(
                    () => Checkbox(
                      value: controller.rememberMe.value,
                      onChanged: (value) => controller.rememberMe.toggle(),
                    ),
                  ),
                  Text(UTexts.rememberMe),
                ],
              ),

              TextButton(
                onPressed: () => Get.to(() => ForgetPasswordScreen()),
                child: Text(
                  UTexts.forgetPassword,
                  style: TextStyle(color: UColors.primary),
                ),
              ),
            ],
          ),
          SizedBox(height: USizes.spaceBtwSections),
          UElevatedButton(
            onPressed: () => controller.loginWithEmailAndPassword(),
            // Get.to(() => controller.loginWithEmailAndPassword()),
            child: Text(UTexts.signIn),
          ),
          SizedBox(height: USizes.spaceBtwItems),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {
                Get.to(() => SignupScreen());
              },
              child: Text(UTexts.createAccount),
            ),
          ),
        ],
      ),
    );
  }
}
