import 'package:e_commerce/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/sizes.dart';
import '../layouts/grid_layout.dart';

class USortableProducts extends StatelessWidget {
  const USortableProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonFormField(
          items: ['name', 'price', 'sale', 'upcoming'].map((filter) {
            return DropdownMenuItem(value: filter, child: Text(filter));
          }).toList(),
          onChanged: (value) {},
          decoration: InputDecoration(prefixIcon: Icon(Iconsax.sort)),
        ),
        SizedBox(height: USizes.spaceBtwItems),

        UGridLayout(
          itemCount: 10,
          itemBuilder: (context, index) => UProductCardVertical(),
        ),
      ],
    );
  }
}
