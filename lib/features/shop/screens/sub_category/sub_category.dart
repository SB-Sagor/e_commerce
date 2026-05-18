import 'package:flutter/material.dart';
import '../../../../common/style/padding.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/products/product_cards/product_card_horizontal.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';

class SubCategoryScreen extends StatelessWidget {
  const SubCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: UAppBar(
        showBackArrow: true,
        title: Text('Caps', style: Theme.of(context).textTheme.headlineMedium),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: UPadding.screenPadding,
          child: Column(
            children: [
              /// Sub Category
              USectionHeading(title: 'Stylish Caps', onPressed: () {}),
              SizedBox(height: USizes.spaceBtwItems / 2),

              /// Horizontal Product Card
              SizedBox(
                height: 120,
                child: ListView.separated(
                  separatorBuilder: (context, index) =>
                      SizedBox(width: USizes.spaceBtwItems / 2),
                  itemCount: 6,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return UProductCardHorizontal();
                  },
                ),
              ), // Container
            ],
          ), // Column
        ), // Padding
      ), // SingleChildScrollView
    );
  }
}
