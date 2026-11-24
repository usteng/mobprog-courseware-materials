// Slide: "Colors Have Jobs".
// Material 3 components read named roles from the ColorScheme. Switch between
// light and dark mode and every swatch updates, because nothing is hardcoded.
import 'package:flutter/material.dart';

import 'role_swatch.dart';

class ColorRolesPanel extends StatelessWidget {
  const ColorRolesPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    // A record per role: (name, background, text color on it).
    final roles = <(String, Color, Color)>[
      ('primary', cs.primary, cs.onPrimary),
      ('onPrimary', cs.onPrimary, cs.primary),
      ('secondary', cs.secondary, cs.onSecondary),
      ('surface', cs.surface, cs.onSurface),
      ('error', cs.error, cs.onError),
      ('outline', cs.outline, cs.surface),
    ];

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        for (final (name, color, onColor) in roles)
          RoleSwatch(name: name, color: color, onColor: onColor),
      ],
    );
  }
}
