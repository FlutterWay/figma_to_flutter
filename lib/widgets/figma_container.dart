import 'package:figma_to_flutter/figma_to_flutter.dart';
import 'package:flutter/material.dart';

class FigmaContainer extends StatelessWidget {
  final AlignmentGeometry? alignment;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final Decoration? decoration;
  final Decoration? foregroundDecoration;
  final double? width;
  final double? height;
  final BoxConstraints? constraints;
  final EdgeInsetsGeometry? margin;
  final Matrix4? transform;
  final AlignmentGeometry? transformAlignment;
  final Widget? child;
  final Clip clipBehavior;
  const FigmaContainer(
      {super.key,
      this.alignment,
      this.padding,
      this.color,
      this.decoration,
      this.foregroundDecoration,
      this.width,
      this.height,
      this.constraints,
      this.margin,
      this.transform,
      this.transformAlignment,
      this.child,
      this.clipBehavior = Clip.none});

  @override
  Widget build(BuildContext context) {
    return Container(
        key: key,
        alignment: alignment,
        padding: padding,
        color: color,
        decoration: decoration,
        foregroundDecoration: foregroundDecoration,
        width: width != null && width != double.infinity
            ? Figma.of(context).px(width!, Axis.horizontal)
            : width,
        height: height != null && height != double.infinity
            ? Figma.of(context).px(height!, Axis.vertical)
            : height,
        constraints: constraints,
        margin: margin,
        transform: transform,
        transformAlignment: transformAlignment,
        clipBehavior: clipBehavior,
        child: child);
  }
}
