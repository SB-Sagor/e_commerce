import 'package:e_commerce/utils/constants/enums.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../common/style/padding.dart';
import '../../../../../common/widgets/custom_shapes/rounded_container.dart';
import '../../../../../common/widgets/images/circular_image.dart';
import '../../../../../common/widgets/texts/brand_title_with_verify_icon.dart';
import '../../../../../common/widgets/texts/product_price_text.dart';
import '../../../../../common/widgets/texts/product_title_text.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/images.dart';
import '../../../../../utils/constants/sizes.dart';

class UProductMetaData extends StatelessWidget {
  const UProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            URoundedContainer(
              radius: USizes.sm,
              backgroundColor: UColors.secondary.withValues(alpha: 0.8),
              padding: EdgeInsets.symmetric(
                horizontal: USizes.sm,
                vertical: USizes.xs,
              ),
              child: Text(
                '20%',
                style: Theme.of(
                  context,
                ).textTheme.labelLarge!.apply(color: UColors.black),
              ),
            ),
            SizedBox(width: USizes.spaceBtwItems),

            Text(
              '\$250',
              style: Theme.of(context).textTheme.titleSmall!.apply(
                decoration: TextDecoration.lineThrough,
              ),
            ),
            SizedBox(width: USizes.spaceBtwItems),

            UProductPriceText(price: '150', isLarge: true),
            Spacer(),

            IconButton(onPressed: () {}, icon: Icon(Icons.share)),
          ],
        ),
        SizedBox(height: USizes.spaceBtwItems / 2),

        UProductTitleText(title: 'Zara New'),
        SizedBox(height: USizes.spaceBtwItems / 2),

        Row(
          children: [
            UProductTitleText(title: 'Status'),
            SizedBox(width: USizes.spaceBtwItems / 2),
            Text('In Stock', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        SizedBox(height: USizes.spaceBtwItems / 2),

        Row(
          children: [
            UCircularImage(image: UImages.zara, height: 32.0, width: 32.0),
            SizedBox(width: USizes.spaceBtwItems),
            UBrandTitleWithVerifyIcon(
              title: 'Zara',
              brandTextSize: TextSizes.medium,
            ),
          ],
        ),
      ],
    );
  }
}
