import 'package:figma_to_flutter/figma_to_flutter.dart';
import 'package:flutter/material.dart';

class FigmaText extends StatelessWidget {
  final double height;
  final double? width;
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final StrutStyle? strutStyle;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? softWrap;
  final String? semanticsLabel;
  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;
  final Color? selectionColor;
  final AlignmentGeometry alignment;
  final TextScaler? textScaler;
  const FigmaText(
    this.text, {
    required this.height,
    super.key,
    this.style,
    this.width,
    this.alignment = Alignment.centerLeft,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.strutStyle,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.textScaler,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Figma.of(context).px(height, Axis.vertical),
      width:
          width != null ? Figma.of(context).px(width!, Axis.horizontal) : null,
      child: Align(
        alignment: alignment,
        child: Text(
          text,
          style: style,
          textAlign: textAlign,
          softWrap: softWrap,
          maxLines: maxLines,
          overflow: overflow,
          strutStyle: strutStyle,
          textDirection: textDirection,
          locale: locale,
          textScaler: textScaler,
          semanticsLabel: semanticsLabel,
          textWidthBasis: textWidthBasis,
          textHeightBehavior: textHeightBehavior,
          selectionColor: selectionColor,
        ),
      ),
    );
  }
}
