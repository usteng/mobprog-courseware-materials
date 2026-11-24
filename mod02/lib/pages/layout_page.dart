// Part 02 of the deck: "The Layout Model".
// A short, fixed list of demos, so a plain ListView (eager) is fine here.
import 'package:flutter/material.dart';

import '../widgets/axis_demo.dart';
import '../widgets/badge_avatar.dart';
import '../widgets/constraints_readout.dart';
import '../widgets/flex_demo.dart';
import '../widgets/overflow_demo.dart';
import '../widgets/profile_row.dart';
import '../widgets/section_header.dart';

class LayoutPage extends StatelessWidget {
  const LayoutPage({super.key});

  static const _side = EdgeInsets.symmetric(horizontal: 16);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(bottom: 24),
      children: const [
        SectionHeader(
          'Constraints go down',
          caption: 'LayoutBuilder reads the limits that the parent passes in.',
        ),
        Padding(padding: _side, child: ConstraintsReadout()),
        SectionHeader(
          'Row: main axis',
          caption: 'Pick a mainAxisAlignment value and watch the boxes move.',
        ),
        Padding(padding: _side, child: AxisDemo()),
        SectionHeader(
          'Expanded and flex',
          caption: 'Expanded children share the free space by their flex.',
        ),
        Padding(padding: _side, child: FlexDemo()),
        SectionHeader(
          'A profile row',
          caption: 'Expanded gives the text all the free space, which pushes '
              'the icon to the right edge.',
        ),
        Card(
          margin: _side,
          child: ProfileRow(
            initials: 'JD',
            name: 'Juan dela Cruz',
            program: 'BSIT 2',
          ),
        ),
        SectionHeader(
          'Stack and Positioned',
          caption: 'Later children paint on top; Clip.none lets the badge '
              'hang outside.',
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(24, 8, 16, 0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: BadgeAvatar(initials: 'JD', count: 3),
          ),
        ),
        SectionHeader(
          'Fixing an overflow',
          caption: 'Turn the switch off to see the yellow-and-black stripes.',
        ),
        Padding(padding: _side, child: OverflowDemo()),
      ],
    );
  }
}
