import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/icons/circular_icon.dart';
import '../../../../../common/widgets/images/rounded_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/images.dart';
import '../../../../../utils/constants/sizes.dart';

class UProductThumbnailAndSlider extends StatelessWidget {
  const UProductThumbnailAndSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    return Container(
      color: dark ? UColors.light : UColors.light, //color should change to dark
      child: Stack(
        children: [
          SizedBox(
            height: 300,
            child: Padding(
              padding: EdgeInsets
                  .zero, // it can be changed .all(productImageRadius*2)
              child: Center(child: Image(image: AssetImage(UImages.product2))),
            ),
          ),

          //slider image
          Positioned(
            left: USizes.defaultSpace,
            right: 0,
            bottom: 10,
            child: SizedBox(
              height: 80.0,
              child: ListView.separated(
                separatorBuilder: (context, index) =>
                    SizedBox(width: USizes.spaceBtwItems / 2),
                itemCount: 4,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => URoundedImage(
                  width: 80.0,
                  // padding: EdgeInsets.all(USizes.sm),
                  border: Border.all(color: UColors.primary),
                  // backgroundColor: dark ? UColors.dark : UColors.light,
                  imageUrl: UImages.product3,
                ),
              ),
            ),
          ),

          UAppBar(
            showBackArrow: true,
            actions: [UCircularIcon(icon: Iconsax.heart5, color: Colors.red)],
          ),
        ],
      ),
    );
  }
}
