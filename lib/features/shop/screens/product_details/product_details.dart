import 'package:e_commerce/common/style/padding.dart';
import 'package:e_commerce/common/widgets/button/elevated_button.dart';
import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:e_commerce/features/shop/screens/product_details/widgets/bottom_add_to_cart.dart';
import 'package:e_commerce/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:e_commerce/features/shop/screens/product_details/widgets/product_mata_data.dart';
import 'package:e_commerce/features/shop/screens/product_details/widgets/product_thumbnail_and_slider.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///slider thumbnail
            UProductThumbnailAndSlider(),

            Padding(
              padding: UPadding.screenPadding,
              child: Column(
                children: [
                  ///price
                  UProductMetaData(),

                  ///attribute
                  UProductAttributes(),
                  SizedBox(height: USizes.spaceBtwItems),

                  ///checkout button
                  UElevatedButton(onPressed: () {}, child: Text('Checkout')),
                  SizedBox(height: USizes.spaceBtwItems),

                  ///descriptions
                  USectionHeading(
                    title: 'Descriptions',
                    showActionButton: false,
                  ),
                  SizedBox(height: USizes.spaceBtwItems),

                  ReadMoreText(
                    'Zara is a Spanish fast fashion retail subsidiary of the Spanish multinational fashion design, manufacturing, and retailing group Index.',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show More',
                    trimExpandedText: ' Less',
                    moreStyle: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w800,
                    ),
                    lessStyle: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(height: USizes.spaceBtwItems),
                ],
              ),
            ),
          ],
        ),
      ),

      ///bottom navigation bar
      bottomNavigationBar: UBottomAddToCart(),
      //bottom navigation
    );
  }
}
