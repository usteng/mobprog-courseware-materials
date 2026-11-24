// Slide: "A Lazy List of ListTiles" (course_list.dart).
// ListView.builder builds rows only as they scroll into view, so it stays fast
// for long lists. ListTile gives each row a standard layout.
import 'package:flutter/material.dart';

import '../models/course.dart';

class CourseList extends StatelessWidget {
  const CourseList({super.key, required this.courses});

  final List<Course> courses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 88), // room above the FAB
      itemCount: courses.length,
      itemBuilder: (context, i) {
        final course = courses[i];
        return ListTile(
          leading: CircleAvatar(child: Text(course.department)),
          title: Text(course.code),
          subtitle: Text('${course.title} · ${course.units} units'),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {
            debugPrint('Tapped ${course.code}');
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Tapped ${course.code}')),
            );
          },
        );
      },
    );
  }
}
