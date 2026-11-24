// The data the screens display. A model is plain Dart: no widgets here.
import 'course_category.dart';

// Files that import course.dart also get CourseCategory.
export 'course_category.dart';

class Course {
  const Course({
    required this.code,
    required this.title,
    required this.units,
    required this.category,
  });

  final String code; // for example 'CS 101'
  final String title;
  final int units;
  final CourseCategory category;

  /// The department prefix of the code, such as 'CS', 'IT', or 'IS'.
  String get department => code.split(' ').first;
}
