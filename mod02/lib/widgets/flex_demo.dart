// Slides: "Six Widgets You Will Use Daily" and "Main Axis and Cross Axis".
// The fixed box keeps its 72 pixels. The two Expanded boxes split what is
// left: flex 2 gets twice the share of flex 1.
import 'package:flutter/material.dart';

import 'demo_box.dart';

class FlexDemo extends StatelessWidget {
  const FlexDemo({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Row(
      children: [
        Expanded(
          child: DemoBox(
            label: 'flex 1',
            color: colors.primaryContainer,
            onColor: colors.onPrimaryContainer,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          flex: 2,
          child: DemoBox(
            label: 'flex 2',
            color: colors.primary,
            onColor: colors.onPrimary,
          ),
        ),
        const SizedBox(width: 8),
        DemoBox(
          label: '72 px',
          width: 72,
          color: colors.secondaryContainer,
          onColor: colors.onSecondaryContainer,
        ),
      ],
    );
  }
}
