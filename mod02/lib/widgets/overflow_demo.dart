// Slides: "Reading Overflow Errors" and "Fixing an Overflow".
// A Row lets its children be as wide as they like, so a long Text runs past
// the edge and Flutter paints yellow-and-black stripes (in debug mode). The
// debug console names the widget and the overflow in pixels. Wrapping the
// Text in Expanded limits it to the space that is left, so it wraps instead.
import 'package:flutter/material.dart';

class OverflowDemo extends StatefulWidget {
  const OverflowDemo({super.key});

  @override
  State<OverflowDemo> createState() => _OverflowDemoState();
}

class _OverflowDemoState extends State<OverflowDemo> {
  bool _fixed = true;

  static const _message = 'Enrollment for the 2nd term closes on Friday. '
      'Settle your balance at the cashier before then.';

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SwitchListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text('Wrap the long text in Expanded'),
          value: _fixed,
          onChanged: (value) => setState(() => _fixed = value),
        ),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            border: Border.all(color: colors.outline),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Icon(Icons.campaign_outlined, color: colors.primary),
              const SizedBox(width: 8),
              if (_fixed)
                const Expanded(child: Text(_message))
              else
                const Text(_message), // overflows on a phone-width screen
            ],
          ),
        ),
      ],
    );
  }
}
