// Part 01 and Part 04 of the deck: state, lifecycle, BuildContext, assets,
// themes, and color roles, all on the "Me" tab.
import 'package:flutter/material.dart';

import '../widgets/color_roles_panel.dart';
import '../widgets/counter.dart';
import '../widgets/lifecycle_clock.dart';
import '../widgets/profile_row.dart';
import '../widgets/section_header.dart';
import '../widgets/theme_mode_picker.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({
    super.key,
    required this.themeMode,
    required this.onThemeModeChanged,
  });

  final ThemeMode themeMode;
  final ValueChanged<ThemeMode> onThemeModeChanged;

  static const _side = EdgeInsets.symmetric(horizontal: 16);

  @override
  Widget build(BuildContext context) {
    // MediaQuery.sizeOf(context) looks up the nearest MediaQuery above this
    // widget, the same way Theme.of(context) finds the nearest theme.
    final size = MediaQuery.sizeOf(context);
    final textTheme = Theme.of(context).textTheme;

    return ListView(
      padding: const EdgeInsets.only(bottom: 24),
      children: [
        const Card(
          margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: ProfileRow(
            initials: 'JD',
            name: 'Juan dela Cruz',
            program: 'BSIT 2',
          ),
        ),
        const SectionHeader(
          'Changing the screen with setState',
          caption: 'Each tap calls setState, so build() runs again.',
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Align(alignment: Alignment.centerLeft, child: Counter()),
        ),
        const SectionHeader(
          'initState, build, and dispose',
          caption: 'Switch to another tab and back: the timer restarts, and '
              'the debug console shows dispose and initState.',
        ),
        const LifecycleClock(),
        const SectionHeader(
          'Bundled asset',
          caption: 'Flutter picks the 2.0x or 3.0x file on sharper screens.',
        ),
        Padding(
          padding: _side,
          child: Row(
            children: [
              Image.asset(
                'assets/images/logo.png',
                width: 64,
                height: 64,
                semanticLabel: 'Course logo',
              ),
              const SizedBox(width: 16),
              const Expanded(
                child: Text("Image.asset('assets/images/logo.png')"),
              ),
            ],
          ),
        ),
        const SectionHeader(
          'Light and dark themes',
          caption: 'System follows the phone setting.',
        ),
        Padding(
          padding: _side,
          child: ThemeModePicker(
            value: themeMode,
            onChanged: onThemeModeChanged,
          ),
        ),
        const SectionHeader(
          'Colors have jobs',
          caption: 'Read from Theme.of(context).colorScheme; never hardcode.',
        ),
        const Padding(padding: _side, child: ColorRolesPanel()),
        const SectionHeader('What BuildContext can find'),
        Padding(
          padding: _side,
          child: Text(
            'MediaQuery.sizeOf(context): '
            '${size.width.toStringAsFixed(0)} x '
            '${size.height.toStringAsFixed(0)} logical pixels',
            style: textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}
