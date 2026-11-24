// Slide: "Material 3 in Use": chips filter content, and the selected chip
// uses a filled style. This widget is stateless: the page that owns the
// filter passes in the current value and a callback (lifting state up).
import 'package:flutter/material.dart';

import '../models/course.dart';

class CategoryChips extends StatelessWidget {
  const CategoryChips({
    super.key,
    required this.selected,
    required this.onSelected,
  });

  /// The selected category, or null for "All".
  final CourseCategory? selected;
  final ValueChanged<CourseCategory?> onSelected;

  static const List<(String, CourseCategory?)> _options = [
    ('All', null),
    ('Core', CourseCategory.core),
    ('Electives', CourseCategory.elective),
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: [
        for (final (label, value) in _options)
          ChoiceChip(
            label: Text(label),
            selected: selected == value,
            onSelected: (_) => onSelected(value),
          ),
      ],
    );
  }
}
