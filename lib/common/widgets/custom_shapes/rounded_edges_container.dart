import 'package:e_commerce/common/widgets/custom_shapes/clipper/custom_rounder_clipper.dart';
import 'package:flutter/material.dart';

class URoundedEdges extends StatelessWidget {
  const URoundedEdges({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(clipper: URoundedEdgesContainer(), child: child);
  }
}
