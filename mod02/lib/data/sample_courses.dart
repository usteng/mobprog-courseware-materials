// Sample data so the demo runs without a backend.
// Later modules replace this file with a REST API, SQLite, and Firestore.
import '../models/course.dart';

const List<Course> sampleCourses = [
  Course(code: 'CS 101', title: 'Introduction to Computing', units: 3, category: CourseCategory.core),
  Course(code: 'IT 102', title: 'Computer Programming 1', units: 3, category: CourseCategory.core),
  Course(code: 'IS 103', title: 'Fundamentals of Information Systems', units: 3, category: CourseCategory.core),
  Course(code: 'CS 104', title: 'Discrete Structures', units: 3, category: CourseCategory.core),
  Course(code: 'IT 105', title: 'Data Structures and Algorithms', units: 3, category: CourseCategory.core),
  Course(code: 'IS 106', title: 'Systems Analysis and Design', units: 3, category: CourseCategory.core),
  Course(code: 'IT 107', title: 'Mobile App Development', units: 3, category: CourseCategory.core),
  Course(code: 'CS 201', title: 'Game Development', units: 3, category: CourseCategory.elective),
  Course(code: 'IT 202', title: 'Web Systems and Technologies', units: 3, category: CourseCategory.elective),
  Course(code: 'IS 203', title: 'Data Analytics', units: 3, category: CourseCategory.elective),
  Course(code: 'CS 204', title: 'Human-Computer Interaction', units: 3, category: CourseCategory.elective),
  Course(code: 'IT 205', title: 'Cloud Computing', units: 3, category: CourseCategory.elective),
];
