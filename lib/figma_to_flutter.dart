library figma_to_flutter;

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'figma_design_io.dart';

export 'widgets/figma_box.dart';
export 'widgets/figma_container.dart';
export 'widgets/figma_text.dart';

class Figma extends GetxController {
  final double _deviceWidth, _deviceHeight;

  double get deviceWidth => _deviceWidth;
  double get deviceHeight => _deviceHeight;
  String? get defaultFontFamily => _defaultFontFamily;
  String? get defaultCustomFontFamily => _defaultCustomFontFamily;
  FontWeight? get defaultFontWeight => _defaultFontWeight;
  Color? get defaultTextColor => _defaultTextColor;

  final String? _defaultFontFamily;
  final String? _defaultCustomFontFamily;
  final FontWeight? _defaultFontWeight;
  final Color? _defaultTextColor;

  Figma(
      this._deviceWidth,
      this._deviceHeight,
      this._defaultFontFamily,
      this._defaultCustomFontFamily,
      this._defaultFontWeight,
      this._defaultTextColor);

  static Figma get instance => Get.find<Figma>();

  static void setup(
      {required double deviceWidth,
      required double deviceHeight,
      FontWeight? defaultFontWeight,
      Color? defaultTextColor,
      String? defaultFontFamily,
      String? defaultCustomFontFamily}) {
    Get.put(Figma(deviceWidth, deviceHeight, defaultFontFamily,
        defaultCustomFontFamily, defaultFontWeight, defaultTextColor));
  }

  static Figma2Flutter of(BuildContext context) {
    return Figma2Flutter(context);
  }
}
