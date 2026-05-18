import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import '../../../../../common/widgets/products/cart/cart_item.dart';
import '../../../../../common/widgets/products/cart/product_quantity_with_add_remove.dart';
import '../../../../../common/widgets/texts/product_price_text.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class UCartItems extends StatelessWidget {
  const UCartItems({super.key, this.showActionButton = true});
  final bool showActionButton;

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (context, index) =>
          SizedBox(height: USizes.spaceBtwSections / 2),
      itemCount: 2,
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.all(USizes.sm),
          decoration: BoxDecoration(
            border: Border.all(
              color: dark ? UColors.darkContainer : UColors.darkGrey,
            ),
            borderRadius: BorderRadius.circular(USizes.productImageRadius),
            color: dark ? UColors.dark : UColors.light,
          ),
          child: Column(
            children: [
              UCartItem(),
              if (showActionButton) SizedBox(height: USizes.spaceBtwItems),
              if (showActionButton)
                Row(
                  children: [
                    /// Increment Button
                    SizedBox(width: 70.0),
                    UProductQuantityWithAddRemove(), Spacer(),
                    UProductPriceText(price: '425'),
                  ],
                ),
            ],
          ),
        );
      },
    );
  }
}
