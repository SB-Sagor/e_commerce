import 'package:e_commerce/utils/constants/images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/custom_shapes/rounded_container.dart';
import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class UBillingPaymentSection extends StatelessWidget {
  const UBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        USectionHeading(
          title: 'Payment Method',
          buttonTitle: 'Change',
          onPressed: () {},
        ),
        SizedBox(height: USizes.spaceBtwItems / 2),
        Row(
          children: [
            URoundedContainer(
              width: 60,
              height: 35,
              backgroundColor: dark ? UColors.dark : UColors.light,
              padding: EdgeInsets.all(USizes.sm),
              child: Image(
                image: AssetImage(UImages.masterCard),
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(width: USizes.spaceBtwItems / 2),
            Text('Master Card', style: Theme.of(context).textTheme.bodyLarge),
          ],
        ), // RoundedContainer
      ],
    );
  }
}
