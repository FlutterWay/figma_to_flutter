import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:figma_to_flutter/figma_to_flutter.dart';

class ViewCategory extends StatelessWidget {
  final String iconPath, text;
  final Color iconBackground;
  const ViewCategory(
      {super.key,
      required this.iconBackground,
      required this.iconPath,
      required this.text});

  @override
  Widget build(BuildContext context) {
    var figma = Figma.of(context);
    return Padding(
      padding: figma.paddingOnly(right: 12),
      child: FigmaContainer(
        height: 52,
        decoration: BoxDecoration(
            color: const Color(0xFFF8F8F8),
            borderRadius: BorderRadius.circular(16)),
        padding: figma.paddingAll(8),
        child: Row(children: [
          FigmaContainer(
            height: double.infinity,
            width: 36,
            decoration: BoxDecoration(
                color: iconBackground, borderRadius: BorderRadius.circular(8)),
            alignment: Alignment.center,
            child: Image.asset(
              "assets/icons/star.png",
              width: figma.px(21, Axis.horizontal),
            ),
          ),
          figma.spacer(8, Axis.horizontal),
          Text(
            text,
            style: figma.style(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF242424)),
          ),
          figma.spacer(16, Axis.horizontal),
        ]),
      ),
    );
  }
}
