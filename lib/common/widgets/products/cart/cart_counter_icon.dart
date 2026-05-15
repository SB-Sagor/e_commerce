import 'package:e_commerce/features/shop/screens/cart/cart.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../utils/constants/colors.dart';

class UCartCounterIcon extends StatelessWidget {
  const UCartCounterIcon({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    return Stack(
      children: [
        ///bag/cart
        IconButton(
          onPressed: () => Get.to(() => CartScreen()),
          icon: Icon(
            Iconsax.shopping_bag,
            color: dark ? UColors.dark : UColors.light,
          ),
        ),
        Positioned(
          right: 6.0,
          child: Container(
            height: 18,
            width: 18,
            decoration: BoxDecoration(
              color: dark ? UColors.dark : UColors.light,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                '2',
                style: Theme.of(context).textTheme.labelLarge!.apply(
                  fontSizeFactor: 0.8,
                  color: dark ? UColors.light : UColors.dark,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
