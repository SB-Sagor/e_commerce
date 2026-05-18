import 'package:e_commerce/common/widgets/shimmer/shimmer_effect.dart';
import 'package:e_commerce/features/personalization/controller/user_controller.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/products/cart/cart_counter_icon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/texts.dart';

class UHomeAppBar extends StatelessWidget {
  const UHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    final controller = Get.put(UserController());
    return UAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            UHelperFunctions.getGreetingMessage(),
            // UTexts.homeAppBarTitle,
            style: Theme.of(
              context,
            ).textTheme.labelMedium!.apply(color: UColors.grey),
          ),
          Obx(() {
            if (controller.profileLoading.value) {
              return UShimmerEffect(width: 80, height: 15);
            }
            return Text(
              // UTexts.homeAppBarSubTitle,
              controller.user.value.fullName,
              style: Theme.of(
                context,
              ).textTheme.headlineSmall!.apply(color: UColors.grey),
            );
          }),
        ],
      ),
      actions: [UCartCounterIcon()],
    );
  }
}
