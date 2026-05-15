import 'package:flutter/cupertino.dart';

import '../../../utils/constants/images.dart';
import 'circular_image.dart';

class UserProfileLogo extends StatelessWidget {
  const UserProfileLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return UCircularImage(
      height: 120.0,
      width: 120.0,
      image: UImages.banner3,
      borderWidth: 5.0,
      padding: 0,
    );
  }
}
