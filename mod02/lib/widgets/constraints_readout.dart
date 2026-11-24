// Slides: "Constraints go down. Sizes go up. Parent sets position." and
// "One Pass, Three Moves".
// LayoutBuilder hands its builder the constraints from the parent, so you can
// see the limits a widget actually receives. Compare them with the full
// window width from MediaQuery: the padding around this box takes some away.
import 'package:flutter/material.dart';

import '../theme/breakpoints.dart';

class ConstraintsReadout extends StatelessWidget {
  const ConstraintsReadout({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final windowWidth = MediaQuery.sizeOf(context).width;
    final windowClass = windowWidth < Breakpoints.medium
        ? 'compact'
        : windowWidth < Breakpoints.expanded
            ? 'medium'
            : 'expanded';

    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: colors.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            'This box may be ${constraints.minWidth.toStringAsFixed(0)} to '
            '${constraints.maxWidth.toStringAsFixed(0)} px wide.\n'
            'The window is ${windowWidth.toStringAsFixed(0)} px wide '
            '($windowClass).',
          ),
        );
      },
    );
  }
}
