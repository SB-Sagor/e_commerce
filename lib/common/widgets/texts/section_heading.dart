import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class USectionHeading extends StatelessWidget {
  const USectionHeading({
    super.key,
    this.color,
    required this.title,
    this.buttonTitle = "View all",
    this.onPressed,
  });
  final Color? color;
  final String title, buttonTitle;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(buttonTitle, style: TextStyle(color: UColors.primary)),
        ),
      ],
    );
  }
}
