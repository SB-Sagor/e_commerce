import 'package:e_commerce/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:e_commerce/features/shop/controllers/home/home_controller.dart';
import 'package:e_commerce/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:e_commerce/features/shop/screens/home/widgets/home_categories.dart';
import 'package:e_commerce/features/shop/screens/home/widgets/primary_header_container.dart';
import 'package:e_commerce/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/device_helpers.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/textfields/search_bar.dart';
import '../../../../common/widgets/texts/section_heading.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool dark = UHelperFunctions.isDarkMode(context);
    final controller = Get.put(HomeController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(height: UDeviceHelper.getScreenHeight(context) * 0.36),
                UPrimaryHeaderContainer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UHomeAppBar(),
                      SizedBox(height: USizes.spaceBtwSections),
                      UHomeCategories(),
                    ],
                  ),
                ),
                USearchBar(),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(USizes.defaultSpace),
              child: Column(
                children: [
                  //slider images
                  UPromoSlider(
                    banners: [
                      UImages.banner1,
                      UImages.banner3,
                      UImages.banner2,
                    ],
                  ),
                  SizedBox(height: USizes.spaceBtwSections / 2),
                  USectionHeading(title: 'Popular Products', onPressed: () {}),
                  SizedBox(height: USizes.spaceBtwItems / 2),
                  UGridLayout(
                    itemCount: 6,
                    itemBuilder: (BuildContext context, int index) {
                      return UProductCardVertical();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
