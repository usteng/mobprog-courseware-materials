// Slide: "Six Widgets You Will Use Daily": Container combines size, color,
// padding, border, and alignment in one widget. Leave width null and the box
// takes whatever width its parent gives it (for example, inside Expanded).
import 'package:flutter/material.dart';

class DemoBox extends StatelessWidget {
  const DemoBox({
    super.key,
    required this.label,
    required this.color,
    required this.onColor,
    this.width,
    this.height = 56,
  });

  final String label;
  final Color color;
  final Color onColor;
  final double? width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        label,
        style: TextStyle(color: onColor, fontWeight: FontWeight.w700),
      ),
    );
  }
}
