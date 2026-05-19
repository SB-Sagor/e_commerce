import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/texts.dart';
import '../../../../../utils/validators/validation.dart';
import '../../../controller/user_controller.dart';

class ReAuthenticationUserForm extends StatelessWidget {
  const ReAuthenticationUserForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: AppBar(title: const Text('Re-Authenticate User')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(USizes.defaultSpace),
          child: Form(
            key: controller.reAuthFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Email
                TextFormField(
                  controller: controller.email,
                  validator: UValidator.validateEmail,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.direct_right),
                    labelText: UTexts.email,
                  ),
                ),
                const SizedBox(height: USizes.spaceBtwInputFields),

                /// Password
                Obx(
                  () => TextFormField(
                    controller: controller.password,
                    validator: (value) =>
                        UValidator.validateEmptyText('Password', value),
                    obscureText: controller.isPasswordVisible.value,
                    decoration: InputDecoration(
                      labelText: UTexts.password,
                      prefixIcon: const Icon(Iconsax.password_check),
                      suffixIcon: IconButton(
                        onPressed: () => controller.isPasswordVisible.value =
                            !controller.isPasswordVisible.value,
                        icon: Icon(
                          controller.isPasswordVisible.value
                              ? Iconsax.eye_slash
                              : Iconsax.eye,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: USizes.spaceBtwSections),

                /// Login Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => controller.reAuthenticateUser(),
                    child: const Text('verify'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
