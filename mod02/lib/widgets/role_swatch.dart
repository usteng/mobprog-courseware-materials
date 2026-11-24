// One color role from the theme, shown as a labeled swatch.
// The label uses the matching "on" color, so the text stays readable.
import 'package:flutter/material.dart';

class RoleSwatch extends StatelessWidget {
  const RoleSwatch({
    super.key,
    required this.name,
    required this.color,
    required this.onColor,
  });

  final String name;
  final Color color;
  final Color onColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 104,
      height: 64,
      padding: const EdgeInsets.all(8),
      alignment: Alignment.bottomLeft,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Theme.of(context).colorScheme.outlineVariant),
      ),
      child: Text(
        name,
        style: TextStyle(color: onColor, fontWeight: FontWeight.w700),
      ),
    );
  }
}
