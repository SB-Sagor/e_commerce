import 'package:e_commerce/common/widgets/icons/circular_icon.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class UBottomAddToCart extends StatelessWidget {
  const UBottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    bool dark = UHelperFunctions.isDarkMode(context);
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: USizes.defaultSpace,
        vertical: USizes.defaultSpace / 2,
      ),
      decoration: BoxDecoration(
        color: dark ? UColors.darkContainer : UColors.light,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(USizes.cardRadiusLg),
          topRight: Radius.circular(USizes.cardRadiusLg),
        ),
      ),
      child: Row(
        children: [
          UCircularIcon(
            icon: Iconsax.minus,
            backgroundColor: UColors.darkGrey,
            width: 40,
            height: 40,
            color: UColors.white,
          ),
          SizedBox(width: USizes.spaceBtwItems),
          Text('2', style: Theme.of(context).textTheme.titleSmall),
          SizedBox(width: USizes.spaceBtwItems),

          UCircularIcon(
            icon: Iconsax.add,
            backgroundColor: UColors.black,
            width: 40,
            height: 40,
            color: UColors.white,
          ),
          Spacer(),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(USizes.md),
              backgroundColor: UColors.black,
              side: BorderSide(color: UColors.black),
            ),
            child: Row(
              children: [
                Icon(Iconsax.shopping_bag),
                SizedBox(width: USizes.spaceBtwItems),
                Text('Add To Cart'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
