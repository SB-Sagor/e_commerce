import 'package:e_commerce/common/style/padding.dart';
import 'package:e_commerce/common/widgets/brands/brand_card.dart';
import 'package:e_commerce/common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import 'brand_products.dart';

class BrandScreen extends StatelessWidget {
  const BrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UAppBar(
        showBackArrow: true,
        title: Text(
          'All Brands',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: UPadding.screenPadding,
          child: Column(
            children: [
              USectionHeading(title: 'Brands', showActionButton: false),
              SizedBox(height: USizes.spaceBtwItems),

              UGridLayout(
                itemCount: 10,
                itemBuilder: (context, index) => UBrandCard(
                  onTap: () => Get.to(() => BrandProductsScreen()),
                ),
                mainAxisExtent: 80.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
