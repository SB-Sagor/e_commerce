import 'package:e_commerce/common/widgets/shimmer/shimmer_effect.dart';
import 'package:e_commerce/features/personalization/controller/user_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../utils/constants/images.dart';
import 'circular_image.dart';

class UserProfileLogo extends StatelessWidget {
  const UserProfileLogo({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Obx(() {
      bool isProfileAvailable = controller.user.value.profilePicture.isNotEmpty;
if(controller.isProfileUploading.value){
  return UShimmerEffect(width: 120.0, height: 120.0,radius: 120,);
}
      return UCircularImage(
        height: 120.0,
        width: 120.0,
        image: isProfileAvailable
            ? controller.user.value.profilePicture
            : UImages.banner3,
        fit: BoxFit.cover,
        borderWidth: 5.0,
        padding: 0,
        isNetworkImage: isProfileAvailable ? true : false,
      );
    });
  }
}
