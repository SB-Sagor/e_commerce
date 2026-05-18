import 'package:e_commerce/common/style/padding.dart';
import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/common/widgets/custom_shapes/rounded_container.dart';
import 'package:e_commerce/common/widgets/screens/success_screen.dart';
import 'package:e_commerce/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:e_commerce/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:e_commerce/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:e_commerce/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:e_commerce/navigation_menu.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/button/elevated_button.dart';
import '../../../../common/widgets/textfields/promo_code.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: UAppBar(
        showBackArrow: true,
        title: Text(
          'Order Review',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: UPadding.screenPadding,
          child: Column(
            children: [
              UCartItems(showActionButton: false),
              SizedBox(height: USizes.spaceBtwSections),

              UPromoCodeField(),
              SizedBox(height: USizes.spaceBtwSections),

              URoundedContainer(
                showBorder: true,
                padding: UPadding.screenPadding,
                backgroundColor: Colors.transparent,
                child: Column(
                  children: [
                    UBillingAmountSection(),
                    SizedBox(height: USizes.spaceBtwItems / 2),

                    UBillingPaymentSection(),
                    SizedBox(height: USizes.spaceBtwItems / 2),

                    UBillingAddressSection(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(USizes.defaultSpace),
        child: UElevatedButton(
          onPressed: () => Get.to(
            () => SuccessScreen(
              title: 'Payment Success',
              subtitle: 'Your Item will be shipped soon!',
              image: UImages.success,
              onTap: () => Get.offAll(() => NavigationMenu()),
            ),
          ),
          child: Text('Checkout \$263527'),
        ),
      ),
    );
  }
}
