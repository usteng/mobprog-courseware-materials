// Slide: "Designing for Every Screen".
// Material 3 window size classes change layout at 600 and 840 logical pixels.
abstract final class Breakpoints {
  /// Widths from 0 to 599 are compact (phones).
  static const double medium = 600;

  /// Widths of 840 and up are expanded (tablets in landscape, desktops).
  static const double expanded = 840;

  /// Number of grid columns for a given width: 1 means "use a list".
  static int columnsFor(double width) {
    if (width < medium) return 1;
    return width < expanded ? 2 : 3;
  }
}
