// A plain unit test: Breakpoints has no widgets, so no tester is needed.
import 'package:flutter_test/flutter_test.dart';
import 'package:m02_widgets_demo/theme/breakpoints.dart';

void main() {
  test('columnsFor follows the Material 3 window size classes', () {
    expect(Breakpoints.columnsFor(360), 1); // compact phone
    expect(Breakpoints.columnsFor(599), 1);
    expect(Breakpoints.columnsFor(600), 2); // medium
    expect(Breakpoints.columnsFor(839), 2);
    expect(Breakpoints.columnsFor(840), 3); // expanded
    expect(Breakpoints.columnsFor(1440), 3);
  });
}
