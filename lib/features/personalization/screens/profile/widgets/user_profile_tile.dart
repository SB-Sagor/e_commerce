import 'package:e_commerce/features/personalization/screens/edit_profile/edit_profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:iconsax/iconsax.dart';

class UProfileTile extends StatelessWidget {
  const UProfileTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        'Boss Baby',
        style: Theme.of(context).textTheme.headlineMedium,
      ),
      subtitle: Text(
        'boss@gmail.com',
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      trailing: IconButton(
        onPressed: () => Get.to(() => EditProfileScreen()),
        icon: Icon(Iconsax.edit),
      ),
    );
  }
}
