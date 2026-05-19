import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../shimmer/shimmer_effect.dart';

class UCircularImage extends StatelessWidget {
  const UCircularImage({
    super.key,
    this.width = 56,
    this.height = 56,
    this.overlayColor,
    this.backgroundColor,
    required this.image,
    this.fit = BoxFit.cover,
    this.padding = USizes.sm,
    this.isNetworkImage = false,
    this.showBorder = false,
    this.borderColor = UColors.primary,
    this.borderWidth = 1.0,
  });

  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? overlayColor;
  final Color? backgroundColor;
  final double width, height, padding;
  final bool showBorder;
  final Color borderColor;
  final double borderWidth;

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    final bool useNetworkImage =
        isNetworkImage ||
        image.startsWith('http://') ||
        image.startsWith('https://');
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backgroundColor ?? (dark ? UColors.light : UColors.dark),
        borderRadius: BorderRadius.circular(100),
        border: showBorder
            ? Border.all(color: borderColor, width: borderWidth)
            : null,
      ),
      //cache image not working i do not know why
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: useNetworkImage
            ? CachedNetworkImage(
                imageUrl: image,
                fit: fit,
                color: overlayColor == Colors.transparent ? null : overlayColor,
                placeholder: (context, url) =>
                    UShimmerEffect(width: width, height: height, radius: 120),
                errorWidget: (context, url, error) => const Icon(
                  Icons.account_circle,
                  size: 50,
                  color: Colors.grey,
                ),
              )
            : Image(fit: fit, image: AssetImage(image)),
      ),
    );
  }
}
