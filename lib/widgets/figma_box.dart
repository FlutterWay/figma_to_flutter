import 'package:flutter/material.dart';
import '../figma_to_flutter.dart';

class FigmaBox extends StatelessWidget {
  final double? width;
  final double? height;
  final Widget? child;
  const FigmaBox({super.key, this.width, this.height, this.child});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        key: key,
        width: width != null
            ? Figma.of(context).px(width!, Axis.horizontal)
            : null,
        height: height != null
            ? Figma.of(context).px(height!, Axis.vertical)
            : null,
        child: child);
  }
}
