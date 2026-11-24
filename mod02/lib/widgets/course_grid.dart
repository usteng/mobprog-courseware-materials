// Slide: "A Two-Column Grid" (course_grid.dart).
// crossAxisCount fixes the number of columns. A collection for builds one
// card per course. For a very long or unknown number of items, switch to
// GridView.builder, which builds tiles lazily like ListView.builder.
import 'package:flutter/material.dart';

import '../models/course.dart';
import 'course_card.dart';

class CourseGrid extends StatelessWidget {
  const CourseGrid({super.key, required this.courses, this.columns = 2});

  final List<Course> courses;
  final int columns;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: columns,
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      childAspectRatio: 1.3,
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 88),
      children: [
        for (final c in courses) CourseCard(course: c),
      ],
    );
  }
}
