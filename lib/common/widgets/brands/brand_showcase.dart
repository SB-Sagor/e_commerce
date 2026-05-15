import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../custom_shapes/rounded_container.dart';
import 'brand_card.dart';

class UBrandShowCase extends StatelessWidget {
  const UBrandShowCase({super.key, required this.images});
  final List<String> images;
  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    return URoundedContainer(
      showBorder: true,
      borderColor: UColors.darkGrey,
      backgroundColor: Colors.transparent,
      padding: EdgeInsets.all(USizes.md),
      margin: EdgeInsets.only(bottom: USizes.spaceBtwItems),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UBrandCard(showBorder: false),
          Row(
            children: images
                .map((image) => buildBrandImage(dark, image))
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget buildBrandImage(bool dark, String image) {
    return Expanded(
      child: URoundedContainer(
        height: 100,
        margin: EdgeInsets.only(right: USizes.sm),
        padding: EdgeInsets.all(USizes.sm),
        backgroundColor: dark ? UColors.dark : UColors.light,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(22),
          child: Image(image: AssetImage(image), fit: BoxFit.contain),
        ),
      ),
    );
  }
}
