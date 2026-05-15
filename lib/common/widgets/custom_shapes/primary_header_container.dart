import 'package:flutter/cupertino.dart';

import 'circular_container.dart';
import 'clipper/custom_rounder_clipper.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/device_helpers.dart';

class UPrimaryHeaderContainer extends StatelessWidget {
  const UPrimaryHeaderContainer({super.key, required this.child, this.height});
  final Widget child;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: URoundedEdgesContainer(),
      child: Container(
        height: height ?? UDeviceHelper.getScreenHeight(context) * 0.36,
        color: UColors.primary,
        child: Stack(
          children: [
            Positioned(
              top: -150,
              right: -160,
              child: UCircularContainer(
                height: UDeviceHelper.getScreenHeight(context) * 0.36,
                width: UDeviceHelper.getScreenHeight(context) * 0.36,
                backgroundColor: UColors.white.withValues(alpha: 0.1),
              ),
            ),
            Positioned(
              top: 50,
              right: -250,
              child: UCircularContainer(
                height: UDeviceHelper.getScreenHeight(context) * 0.36,
                width: UDeviceHelper.getScreenHeight(context) * 0.36,
                backgroundColor: UColors.white.withValues(alpha: 0.1),
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }
}
