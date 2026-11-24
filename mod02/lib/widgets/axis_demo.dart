// Slide: "Main Axis and Cross Axis".
// In a Row the main axis is horizontal. mainAxisAlignment decides how the
// free space on that axis is shared between the children.
import 'package:flutter/material.dart';

import 'demo_box.dart';

class AxisDemo extends StatefulWidget {
  const AxisDemo({super.key});

  @override
  State<AxisDemo> createState() => _AxisDemoState();
}

class _AxisDemoState extends State<AxisDemo> {
  MainAxisAlignment _alignment = MainAxisAlignment.start;

  static const Map<MainAxisAlignment, String> _options = {
    MainAxisAlignment.start: 'start',
    MainAxisAlignment.center: 'center',
    MainAxisAlignment.spaceBetween: 'between',
    MainAxisAlignment.spaceEvenly: 'evenly',
  };

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SegmentedButton<MainAxisAlignment>(
          showSelectedIcon: false,
          segments: [
            for (final entry in _options.entries)
              ButtonSegment(value: entry.key, label: Text(entry.value)),
          ],
          selected: {_alignment},
          onSelectionChanged: (selection) =>
              setState(() => _alignment = selection.first),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border.all(color: colors.outline),
            borderRadius: BorderRadius.circular(12),
          ),
          // spacing adds a gap between children without adding extra
          // children, so spaceBetween and spaceEvenly stay accurate.
          child: Row(
            mainAxisAlignment: _alignment,
            spacing: 8,
            children: [
              DemoBox(label: 'A', width: 56, color: colors.primary, onColor: colors.onPrimary),
              DemoBox(label: 'B', width: 56, color: colors.secondary, onColor: colors.onSecondary),
              DemoBox(label: 'C', width: 56, color: colors.tertiary, onColor: colors.onTertiary),
            ],
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'Row(mainAxisAlignment: MainAxisAlignment.${_alignment.name})',
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}
