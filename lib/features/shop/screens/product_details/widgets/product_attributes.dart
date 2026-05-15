import 'package:e_commerce/common/style/padding.dart';
import 'package:e_commerce/common/widgets/custom_shapes/rounded_container.dart';
import 'package:e_commerce/common/widgets/texts/product_price_text.dart';
import 'package:e_commerce/common/widgets/texts/product_title_text.dart';
import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../../common/chips/choice_chip.dart';

class UProductAttributes extends StatelessWidget {
  const UProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        ///variation
        // URoundedContainer(
        //   padding: EdgeInsets.all(USizes.md),
        //   backgroundColor: dark ? UColors.darkGrey : UColors.grey,
        //
        //   child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       ///title stock price
        //       Row(
        //         children: [
        //           USectionHeading(
        //             title: 'Variation',
        //             showActionButton: false,
        //           ),
        //           SizedBox(width: USizes.spaceBtwItems),
        //
        //           Column(
        //             children: [
        //               Row(
        //                 children: [
        //                   UProductTitleText(
        //                     title: 'Price: ',
        //                     smallSize: true,
        //                   ),
        //
        //                   Text(
        //                     '250',
        //                     style: Theme.of(context).textTheme.titleSmall!
        //                         .apply(
        //                           decoration: TextDecoration.lineThrough,
        //                         ),
        //                   ),
        //                   SizedBox(width: USizes.spaceBtwItems),
        //
        //                   UProductPriceText(price: '200'),
        //                 ],
        //               ),
        //               Row(
        //                 children: [
        //                   UProductTitleText(
        //                     title: 'Stock: ',
        //                     smallSize: true,
        //                   ),
        //                   Text(
        //                     'In Stock',
        //                     style: Theme.of(context).textTheme.titleSmall,
        //                   ),
        //                 ],
        //               ),
        //             ],
        //           ),
        //         ],
        //       ),
        //
        //       ///attribute descriptions
        //       UProductTitleText(
        //         title: 'This is a new collection of zara',
        //         smallSize: true,
        //         maxLines: 4,
        //       ),
        //     ],
        //   ),
        // ),
        // SizedBox(height: USizes.spaceBtwItems),
        SizedBox(height: USizes.spaceBtwItems),

        /// color and sizes parts
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            USectionHeading(title: 'Colors', showActionButton: false),
            SizedBox(height: USizes.spaceBtwItems / 2),

            Wrap(
              spacing: USizes.sm,
              children: [
                UChoiceChip(
                  text: 'Red',
                  selected: true,
                  onSelected: (value) {},
                ),
                UChoiceChip(
                  text: 'Blue',
                  selected: false,
                  onSelected: (value) {},
                ),
                UChoiceChip(
                  text: 'Yellow',
                  selected: false,
                  onSelected: (value) {},
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: USizes.spaceBtwItems),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            USectionHeading(title: 'Sizes', showActionButton: false),
            SizedBox(height: USizes.spaceBtwItems / 2),

            Wrap(
              spacing: USizes.sm,
              children: [
                UChoiceChip(text: 'S', selected: true, onSelected: (value) {}),
                UChoiceChip(text: 'M', selected: false, onSelected: (value) {}),
                UChoiceChip(text: 'L', selected: false, onSelected: (value) {}),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
