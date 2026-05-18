import 'package:e_commerce/common/widgets/texts/brand_title_with_verify_icon.dart';
import 'package:e_commerce/common/widgets/texts/product_price_text.dart';
import 'package:e_commerce/common/widgets/texts/product_title_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/images.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../custom_shapes/rounded_container.dart';
import '../../icons/circular_icon.dart';
import '../../images/rounded_image.dart';

class UProductCardHorizontal extends StatelessWidget {
  const UProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);

    return Container(
      width: 310,
      padding: EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(USizes.productImageRadius),
        color: dark ? UColors.darkerGrey : UColors.light,
      ), // BoxDecoration
      child: Row(
        children: [
          URoundedContainer(
            height: 120,
            // padding: EdgeInsets.all(USizes.sm),
            backgroundColor: dark ? UColors.darkerGrey : UColors.light,
            child: Stack(
              children: [
                /// Thumbnail
                SizedBox(
                  height: 120,
                  width: 120,
                  child: URoundedImage(imageUrl: UImages.product5),
                ),
                Positioned(
                  top: 8.0,
                  left: 8.0,
                  child: URoundedContainer(
                    radius: USizes.sm,
                    backgroundColor: UColors.secondary.withValues(alpha: 0.8),
                    padding: EdgeInsets.symmetric(
                      horizontal: USizes.sm,
                      vertical: USizes.xs,
                    ),
                    child: Text(
                      '20%',
                      style: Theme.of(
                        context,
                      ).textTheme.labelLarge!.apply(color: UColors.black),
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: UCircularIcon(icon: Iconsax.heart5, color: Colors.red),
                ),
              ],
            ), // Stack
          ), // URoundedContainer

          SizedBox(
            width: 172.0,
            child: Padding(
              padding: const EdgeInsets.only(left: USizes.sm, top: USizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UProductTitleText(title: 'New Arrival', smallSize: true),
                      SizedBox(height: USizes.spaceBtwItems / 2),

                      UBrandTitleWithVerifyIcon(title: 'zara'),
                    ],
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(child: UProductPriceText(price: '65')),
                      Container(
                        height: USizes.iconLg * 1.2,
                        width: USizes.iconLg * 1.2,
                        decoration: BoxDecoration(
                          color: UColors.primary,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(USizes.cardRadiusMd),
                            bottomRight: Radius.circular(
                              USizes.productImageRadius,
                            ),
                          ),
                        ),
                        child: Icon(Iconsax.add, color: UColors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ), // Row
    );
  }
}
