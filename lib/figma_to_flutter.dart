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

  String? defaultFontFamily;

  Figma(this._deviceWidth, this._deviceHeight, this.defaultFontFamily);

  static Figma get instance => Get.find<Figma>();

  static void setup(
      {required double deviceWidth,
      required double deviceHeight,
      String? defaultFontFamily}) {
    Get.put(Figma(deviceWidth, deviceHeight, defaultFontFamily));
  }

  static Figma2Flutter of(BuildContext context) {
    return Figma2Flutter(context);
  }
}
