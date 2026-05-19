import 'package:e_commerce/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../common/widgets/button/elevated_button.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/texts.dart';
import '../../../controllers/signup/signup_controller.dart';
import 'privacy_policy_checkbox.dart';

class USignupForm extends StatelessWidget {
  const USignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = SignupController.instance;

    return Form(
      key: controller.signUpKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                //first name
                child: TextFormField(
                  controller: controller.firstName,
                  validator: (value) =>
                      UValidator.validateEmptyText('First Name', value),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.user),
                    labelText: UTexts.firstName,
                  ),
                ),
              ),
              SizedBox(width: USizes.spaceBtwItems),
              Expanded(
                //last name
                child: TextFormField(
                  controller: controller.lastName,

                  validator: (value) =>
                      UValidator.validateEmptyText('Last Name', value),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.user),
                    labelText: UTexts.lastName,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: USizes.spaceBtwInputFields),
          //email
          TextFormField(
            controller: controller.email,
            autofillHints: [AutofillHints.email],
            validator: (value) => UValidator.validateEmail(value),
            decoration: InputDecoration(
              prefixIcon: Icon(Iconsax.direct_right),
              labelText: UTexts.email,
            ),
          ),
          SizedBox(height: USizes.spaceBtwInputFields),

          //phone number
          TextFormField(
            controller: controller.phoneNumber,

            validator: (value) => UValidator.validatePhoneNumber(value),
            decoration: InputDecoration(
              prefixIcon: Icon(Iconsax.call),
              labelText: UTexts.phoneNo,
            ),
          ),
          SizedBox(height: USizes.spaceBtwInputFields),
          //password
          Obx(
            () => TextFormField(
              obscureText: !controller.isPasswordVisible.value,
              controller: controller.password,
              validator: (value) => UValidator.validatePassword(value),
              decoration: InputDecoration(
                prefixIcon: Icon(Iconsax.password_check),
                labelText: UTexts.password,
                suffixIcon: IconButton(
                  onPressed: () => controller.isPasswordVisible.value =
                      !controller.isPasswordVisible.value,
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
          UPrivacyPolicyCheckbox(),
          SizedBox(height: USizes.spaceBtwItems),
          UElevatedButton(
            onPressed: controller.registerUser,
            child: Text(UTexts.createAccount),
          ),
        ],
      ),
    );
  }
}
