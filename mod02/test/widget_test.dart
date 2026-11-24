// Widget tests for the Module 02 demo. Run with: flutter test
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:m02_widgets_demo/app.dart';
import 'package:m02_widgets_demo/widgets/counter.dart';
import 'package:m02_widgets_demo/widgets/course_grid.dart';
import 'package:m02_widgets_demo/widgets/course_list.dart';

void main() {
  testWidgets('Counter: setState rebuilds with the new count', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: Scaffold(body: Counter())),
    );
    expect(find.text('Tapped 0 times'), findsOneWidget);

    await tester.tap(find.byType(TextButton));
    await tester.pump();
    expect(find.text('Tapped 1 times'), findsOneWidget);
  });

  // Sizes the test window, then starts the app on the Courses tab.
  Future<void> pumpAppAtWidth(WidgetTester tester, double width) async {
    tester.view.physicalSize = Size(width, 900);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(const CourseApp());
  }

  testWidgets('Compact width (under 600) shows a list', (tester) async {
    await pumpAppAtWidth(tester, 400);
    expect(find.byType(CourseList), findsOneWidget);
    expect(find.byType(CourseGrid), findsNothing);
  });

  testWidgets('Medium width (600 to 839) shows a 2-column grid',
      (tester) async {
    await pumpAppAtWidth(tester, 700);
    final grid = tester.widget<CourseGrid>(find.byType(CourseGrid));
    expect(grid.columns, 2);
  });

  testWidgets('Expanded width (840 and up) shows a 3-column grid',
      (tester) async {
    await pumpAppAtWidth(tester, 1000);
    final grid = tester.widget<CourseGrid>(find.byType(CourseGrid));
    expect(grid.columns, 3);
  });

  testWidgets('The Electives chip hides core courses', (tester) async {
    await pumpAppAtWidth(tester, 400);
    expect(find.text('CS 101'), findsOneWidget);

    await tester.tap(find.text('Electives'));
    await tester.pump();
    expect(find.text('CS 101'), findsNothing);
    expect(find.text('CS 201'), findsOneWidget);
  });
}
