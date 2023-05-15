import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:figma_to_flutter/figma_to_flutter.dart';

class ViewImage extends StatelessWidget {
  final String imagePath, text;
  const ViewImage({super.key, required this.imagePath, required this.text});

  @override
  Widget build(BuildContext context) {
    var figma = Figma.of(context);
    return Padding(
      padding: figma.paddingOnly(right: 12),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(28),
        child: FigmaBox(
          width: 212,
          height: 280,
          child: Stack(children: [
            Image.asset(imagePath, fit: BoxFit.cover),
            Positioned(
              top: figma.px(183, Axis.vertical),
              left: figma.px(24, Axis.horizontal),
              child: FigmaBox(
                width: 130,
                child: Text(
                  text,
                  style: figma.style(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
