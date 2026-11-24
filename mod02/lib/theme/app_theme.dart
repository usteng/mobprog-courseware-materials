// Slides: "Theming with a Seed Color" and "Light and Dark Themes".
// ColorScheme.fromSeed builds a full Material 3 palette from one color.
// Widgets read colors with Theme.of(context).colorScheme instead of
// hardcoding them, so the same code works in light and dark mode.
import 'package:flutter/material.dart';

abstract final class AppTheme {
  static const Color seed = Colors.deepPurple;

  // Declared in pubspec.yaml under fonts:
  static const String fontFamily = 'IBM Plex Sans';

  static final ThemeData light = _build(Brightness.light);
  static final ThemeData dark = _build(Brightness.dark);

  static ThemeData _build(Brightness brightness) {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: seed,
        brightness: brightness,
      ),
      fontFamily: fontFamily,
      useMaterial3: true,
    );
  }
}
