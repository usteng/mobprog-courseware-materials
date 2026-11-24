// Slides: "Adapting with LayoutBuilder", "A Lazy List of ListTiles",
// and "A Two-Column Grid".
// Filter chips choose which courses to show; LayoutBuilder reads the width
// and picks a list (compact) or a 2- or 3-column grid (medium, expanded).
import 'package:flutter/material.dart';

import '../data/sample_courses.dart';
import '../models/course.dart';
import '../theme/breakpoints.dart';
import '../widgets/category_chips.dart';
import '../widgets/course_grid.dart';
import '../widgets/course_list.dart';

class CoursesPage extends StatefulWidget {
  const CoursesPage({super.key});

  @override
  State<CoursesPage> createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  // null means "All".
  CourseCategory? _category;

  @override
  Widget build(BuildContext context) {
    final courses = [
      for (final c in sampleCourses)
        if (_category == null || c.category == _category) c,
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
          child: CategoryChips(
            selected: _category,
            onSelected: (value) => setState(() => _category = value),
          ),
        ),
        // The list or grid needs a bounded height inside a Column, so it is
        // wrapped in Expanded: it takes the space the chips leave over.
        Expanded(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final columns = Breakpoints.columnsFor(constraints.maxWidth);
              if (columns == 1) {
                return CourseList(courses: courses); // compact
              }
              return CourseGrid(courses: courses, columns: columns); // medium : expanded
            },
          ),
        ),
      ],
    );
  }
}
