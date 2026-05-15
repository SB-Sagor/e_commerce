import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../icons/circular_icon.dart';

class UProductQuantityWithAddRemove extends StatelessWidget {
  const UProductQuantityWithAddRemove({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        UCircularIcon(
          icon: Iconsax.minus,
          width: 32,
          height: 32,
          size: USizes.iconSm,
          color: !dark ? UColors.black : UColors.white,
          backgroundColor: dark ? UColors.darkerGrey : UColors.light,
        ),
        // UCircularIcon
        SizedBox(width: USizes.spaceBtwItems),
        Text('2', style: Theme.of(context).textTheme.titleSmall),
        SizedBox(width: USizes.spaceBtwItems),

        // Text
        UCircularIcon(
          icon: Iconsax.add,
          width: 32,
          height: 32,
          size: USizes.iconSm,
          color: UColors.white,
          backgroundColor: UColors.primary,
        ),
      ],
    );
  }
}
