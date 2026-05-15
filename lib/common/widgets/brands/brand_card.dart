import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/enums.dart';
import '../../../utils/constants/images.dart';
import '../../../utils/constants/sizes.dart';
import '../custom_shapes/rounded_container.dart';
import '../images/rounded_image.dart';
import '../texts/brand_title_with_verify_icon.dart';

class UBrandCard extends StatelessWidget {
  const UBrandCard({super.key, this.showBorder = true});
  final bool showBorder;
  @override
  Widget build(BuildContext context) {
    return URoundedContainer(
      height: USizes.brandCardHeight,
      showBorder: showBorder,
      padding: EdgeInsets.all(USizes.sm),
      backgroundColor: Colors.transparent,
      child: Row(
        children: [
          Flexible(child: URoundedImage(imageUrl: UImages.zara)),
          SizedBox(width: USizes.spaceBtwItems / 2),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                UBrandTitleWithVerifyIcon(
                  title: 'zara',
                  brandTextSize: TextSizes.large,
                ),
                Text(
                  '172 products',
                  style: Theme.of(context).textTheme.labelMedium,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
