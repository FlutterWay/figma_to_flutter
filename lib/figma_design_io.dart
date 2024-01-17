import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'figma_to_flutter.dart';

class Figma2Flutter {
  final double _width, _height;

  double get width => _width;
  double get height => _height;

  Figma2Flutter(BuildContext context)
      : _width = MediaQuery.of(context).size.width,
        _height = MediaQuery.of(context).size.height;

  double fontSize(double value) {
    return _height * (value / Figma.instance.deviceHeight);
  }

  double px(double value, Axis axisDirection) {
    return axisDirection == Axis.horizontal
        ? _width * (value / Figma.instance.deviceWidth)
        : _height * (value / Figma.instance.deviceHeight);
  }

  Widget spacer(double value, Axis axisDirection) {
    return SizedBox(
      width: axisDirection == Axis.horizontal
          ? _width * (value / Figma.instance.deviceWidth)
          : 1,
      height: axisDirection == Axis.vertical
          ? _height * (value / Figma.instance.deviceHeight)
          : null,
    );
  }

  EdgeInsetsGeometry paddingOnly(
          {double left = 0,
          double top = 0,
          double right = 0,
          double bottom = 0}) =>
      EdgeInsets.only(
          left: px(left, Axis.horizontal),
          top: px(top, Axis.vertical),
          right: px(right, Axis.horizontal),
          bottom: px(bottom, Axis.vertical));

  EdgeInsetsGeometry paddingAll(double value) => EdgeInsets.only(
      left: px(value, Axis.horizontal),
      top: px(value, Axis.vertical),
      right: px(value, Axis.horizontal),
      bottom: px(value, Axis.vertical));

  EdgeInsetsGeometry paddingSymmetric({
    double vertical = 0,
    double horizontal = 0,
  }) =>
      EdgeInsets.symmetric(
          vertical: px(vertical, Axis.vertical),
          horizontal: px(horizontal, Axis.horizontal));

  TextStyle style({
    Color? color,
    Color? backgroundColor,
    double? fontSize,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    String? fontFamily,
    String? googleFont,
    double? letterSpacing,
    double? wordSpacing,
    TextBaseline? textBaseline,
    double? height,
    Locale? locale,
    Paint? foreground,
    Paint? background,
    List<Shadow>? shadows,
    List<FontFeature>? fontFeatures,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
    TextOverflow? overflow,
  }) {
    return googleFont != null || Figma.instance.defaultFontFamily != null
        ? GoogleFonts.getFont(googleFont ?? Figma.instance.defaultFontFamily!,
            color: color ?? Figma.instance.defaultTextColor,
            backgroundColor: backgroundColor,
            fontSize: fontSize,
            fontWeight: fontWeight ?? Figma.instance.defaultFontWeight,
            fontStyle: fontStyle,
            letterSpacing: letterSpacing,
            wordSpacing: wordSpacing,
            textBaseline: textBaseline,
            height: height,
            locale: locale,
            foreground: foreground,
            background: background,
            shadows: shadows,
            fontFeatures: fontFeatures,
            decoration: decoration,
            decorationColor: decorationColor,
            decorationStyle: decorationStyle,
            decorationThickness: decorationThickness)
        : TextStyle(
            color: color,
            fontFamily: Figma.instance.defaultCustomFontFamily ?? fontFamily,
            backgroundColor: backgroundColor,
            fontSize: fontSize,
            fontWeight: fontWeight,
            fontStyle: fontStyle,
            letterSpacing: letterSpacing,
            wordSpacing: wordSpacing,
            textBaseline: textBaseline,
            height: height,
            locale: locale,
            foreground: foreground,
            background: background,
            shadows: shadows,
            fontFeatures: fontFeatures,
            decoration: decoration,
            decorationColor: decorationColor,
            decorationStyle: decorationStyle,
            decorationThickness: decorationThickness,
            overflow: overflow);
  }
}
