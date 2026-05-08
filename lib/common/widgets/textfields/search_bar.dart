import 'package:e_commerce/common/style/shadow.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class USearchBar extends StatelessWidget {
  const USearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    bool dark = UHelperFunctions.isDarkMode(context);
    return Positioned(
      bottom: 0,
      left: USizes.spaceBtwSections,
      right: USizes.spaceBtwSections,
      child: Container(
        height: 55,
        padding: EdgeInsets.symmetric(horizontal: USizes.md),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(USizes.borderRadiusLg),
          color: dark ? UColors.darkerGrey : UColors.light,
          boxShadow: UShadow.searchBarShadow,
        ),
        child: Row(
          children: [
            Icon(
              Iconsax.search_normal,
              color: dark ? UColors.light : UColors.dark,
            ),
            SizedBox(width: USizes.spaceBtwItems),
            Text(
              'Search in Store',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
