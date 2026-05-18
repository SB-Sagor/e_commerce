import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:e_commerce/data/repositories/authentication_repository.dart';
import 'package:e_commerce/features/personalization/controller/user_controller.dart';
import 'package:e_commerce/features/personalization/screens/address/address.dart';
import 'package:e_commerce/features/personalization/screens/profile/widgets/profile_primary_header.dart';
import 'package:e_commerce/features/personalization/screens/profile/widgets/settings_menu_tile.dart';
import 'package:e_commerce/features/personalization/screens/profile/widgets/user_profile_tile.dart';
import 'package:e_commerce/features/shop/screens/order/order.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            UProfilePrimaryHeader(),
            Padding(
              padding: const EdgeInsets.all(USizes.defaultSpace),
              child: Column(
                children: [
                  UProfileTile(),
                  SizedBox(height: USizes.spaceBtwItems),
                  USectionHeading(
                    title: 'Account Setting',
                    showActionButton: false,
                  ),
                  SettingsMenuTile(
                    title: 'My Addresses',
                    subtitle: 'Set shopping delivery address',
                    icon: Iconsax.safe_home,
                    onTap: () => Get.to(() => AddressScreen()),
                  ),
                  SettingsMenuTile(
                    title: 'My Cart',
                    subtitle: 'Add,remove products and move to checkout',
                    icon: Iconsax.shopping_cart,
                    onTap: () {},
                  ),
                  SettingsMenuTile(
                    title: 'My Orders',
                    subtitle: 'In-progress and Completed Order',
                    icon: Iconsax.bag_tick,
                    onTap: () => Get.to(() => OrderScreen()),
                  ),
                  SizedBox(height: USizes.spaceBtwSections),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: AuthenticationRepository.instance.logout,
                       child: Text('Logout'),
                    ),
                  ),
                  SizedBox(height: USizes.spaceBtwSections),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
