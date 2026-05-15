import 'package:e_commerce/utils/constants/enums.dart';
import 'package:flutter/cupertino.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import 'brand_title_text.dart';

class UBrandTitleWithVerifyIcon extends StatelessWidget {
  const UBrandTitleWithVerifyIcon({
    super.key,
    required this.title,
    this.maxLine = 1,
    this.textAlign = TextAlign.center,
    this.brandTextSize = TextSizes.small,
    this.textColor,
    this.iconColor = UColors.primary,
  });
  final String title;
  final int maxLine;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final TextSizes brandTextSize;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: UBrandTitleText(
            title: title,
            maxLine: maxLine,
            textAlign: textAlign,
            brandTextSize: brandTextSize,
            color: textColor,
          ),
        ),
        SizedBox(width: USizes.xs),
        Icon(Iconsax.verify5, color: UColors.primary, size: USizes.iconXs),
      ],
    );
  }
}
