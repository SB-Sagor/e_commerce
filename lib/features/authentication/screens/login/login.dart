import 'package:e_commerce/common/style/padding.dart';
import 'package:e_commerce/features/authentication/controllers/login/login_controller.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

import '../../../../common/widgets/button/social_buttons.dart';
import '../../../../common/widgets/login_signup/form_divider.dart';
import 'widgets/login_form.dart';
import 'widgets/login_header.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: UPadding.screenPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ULoginHeader(),
              SizedBox(height: USizes.spaceBtwItems),
              ULoginForm(),
              SizedBox(height: USizes.spaceBtwSections),
              UFormDivider(title: UTexts.orSignInWith),
              SizedBox(height: USizes.spaceBtwSections),
              USocialButton(),
            ],
          ),
        ),
      ),
    );
  }
}
