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

import '../../../../common/widgets/textfields/search_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool dark = UHelperFunctions.isDarkMode(context);
    final controller = Get.put(HomeController());
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              SizedBox(height: UDeviceHelper.getScreenHeight(context) * 0.41),
              UPrimaryHeaderContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UHomeAppBar(dark: dark),
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
            child: UPromoSlider(banners: [UImages.banner1, UImages.banner2]),
          ),
        ],
      ),
    );
  }
}
