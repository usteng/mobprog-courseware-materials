// Slide: "Stack and Positioned" (badge.dart).
// Later children in a Stack paint on top. Positioned pins a child to the
// Stack's edges, and Clip.none lets the badge hang outside the avatar.
// The slide uses Colors.red; here the badge reads the theme's error role,
// so it also looks right in dark mode.
import 'package:flutter/material.dart';

class BadgeAvatar extends StatelessWidget {
  const BadgeAvatar({super.key, required this.initials, required this.count});

  final String initials;
  final int count;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    // Semantics gives screen readers one clear label for the whole stack.
    return Semantics(
      label: '$initials, $count new notifications',
      excludeSemantics: true,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          CircleAvatar(radius: 32, child: Text(initials)),
          if (count > 0)
            Positioned(
              right: -4,
              top: -4,
              child: CircleAvatar(
                radius: 12,
                backgroundColor: colors.error,
                foregroundColor: colors.onError,
                child: Text('$count', style: const TextStyle(fontSize: 12)),
              ),
            ),
        ],
      ),
    );
  }
}
