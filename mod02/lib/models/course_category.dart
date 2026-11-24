// An enhanced enum: each value carries the label shown on screen.
enum CourseCategory {
  core('Core'),
  elective('Elective');

  const CourseCategory(this.label);

  final String label;
}
