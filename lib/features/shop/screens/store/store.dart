import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:e_commerce/features/shop/screens/brands/all_brands.dart';
import 'package:e_commerce/features/shop/screens/store/widgets/category_tab.dart';
import 'package:e_commerce/features/shop/screens/store/widgets/store_primary_header.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/appbar/tabbar.dart';
import '../../../../common/widgets/brands/brand_card.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: false,
                expandedHeight: 320,
                flexibleSpace: SingleChildScrollView(
                  child: Column(
                    children: [
                      UStorePrimaryHeader(),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: USizes.defaultSpace,
                        ),
                        child: Column(
                          children: [
                            USectionHeading(
                              title: 'Brands',
                              onPressed: () => Get.to(() => BrandScreen()),
                            ),
                            SizedBox(
                              height: USizes.brandCardHeight,
                              child: ListView.separated(
                                separatorBuilder: (context, index) =>
                                    SizedBox(width: USizes.spaceBtwItems),
                                shrinkWrap: true,
                                itemCount: 10,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) => SizedBox(
                                  width: USizes.brandCardWidth,
                                  child: UBrandCard(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                bottom: UTabBar(
                  tabs: [
                    Tab(child: Text('shirt')),
                    Tab(child: Text('polo')),
                    Tab(child: Text('t-shirt')),
                    Tab(child: Text('caps')),
                    Tab(child: Text('polo')),
                    Tab(child: Text('t-shirt')),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              UCategoryTab(),
              UCategoryTab(),
              UCategoryTab(),
              UCategoryTab(),
              UCategoryTab(),
              UCategoryTab(),
            ],
          ),
        ),
      ),
    );
  }
}
