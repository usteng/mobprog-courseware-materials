# Campus Courses: Module 02 Demo

MOBPROG | Mobile App Development (Flutter) · 2nd Term · A.Y. 2026-2027
Companion code for **M02_SlideDeck: Widgets, Layout, and Material 3**.

One Flutter app with three tabs:

- **Courses**: filter chips, a lazy list on phones, and a 2- or 3-column grid on wider screens.
- **Layout**: live demos of constraints, Row and Column, Expanded, Stack, and an overflow you can switch on and off.
- **Me**: a setState counter, a lifecycle timer, a bundled image, a light and dark theme picker, and the color roles.

Every class lives in its own file, and each file starts with a comment naming the slide it supports.

## Run it

You need Flutter 3.27 or later (Dart 3.6 or later).

```bash
cd m02_widgets_demo
flutter create . --project-name m02_widgets_demo   # adds android/, ios/, web/, and other platform folders
flutter pub get
flutter run            # pick an emulator, a phone, Chrome, or Windows
flutter test           # runs the tests in test/
```

`flutter create .` only adds files that are missing. It does not replace the code in `lib/`, `test/`, or `pubspec.yaml`.

## Project structure

```text
lib/
  main.dart                 runApp(const CourseApp())
  app.dart                  MaterialApp, light and dark themes, theme mode
  theme/
    app_theme.dart          ThemeData from ColorScheme.fromSeed
    breakpoints.dart        600 and 840 pixel breakpoints
  models/
    course.dart             Course (re-exports CourseCategory)
    course_category.dart    CourseCategory enum (Core, Elective)
  data/
    sample_courses.dart     12 sample courses
  pages/
    home_page.dart          Scaffold: AppBar, body, FAB, NavigationBar
    courses_page.dart       Chips + LayoutBuilder (list or grid)
    layout_page.dart        Layout demos
    profile_page.dart       State, lifecycle, assets, themes
  widgets/                  One reusable widget per file
assets/images/              logo.png with 2.0x and 3.0x versions
fonts/                      IBM Plex Sans (SIL Open Font License, see OFL.txt)
test/                       Widget and unit tests
```

## Slide to file map

| Slide | File |
| --- | --- |
| Anatomy of main.dart | `lib/main.dart`, `lib/app.dart` |
| Anatomy of a Scaffold | `lib/pages/home_page.dart` |
| Stateless vs. Stateful Widgets | `lib/widgets/profile_row.dart` (stateless), `lib/widgets/counter.dart` (stateful) |
| Changing the Screen with setState | `lib/widgets/counter.dart` |
| initState, build, and dispose | `lib/widgets/lifecycle_clock.dart` |
| What Is BuildContext? | `lib/pages/profile_page.dart` (MediaQuery), `lib/pages/home_page.dart` (ScaffoldMessenger) |
| Constraints go down; One Pass, Three Moves | `lib/widgets/constraints_readout.dart` |
| Six Widgets You Will Use Daily | `lib/widgets/demo_box.dart`, `lib/widgets/flex_demo.dart` |
| Main Axis and Cross Axis | `lib/widgets/axis_demo.dart`, `lib/widgets/flex_demo.dart` |
| A Profile Row with Expanded | `lib/widgets/profile_row.dart` |
| Reading and Fixing Overflow Errors | `lib/widgets/overflow_demo.dart` |
| Stack and Positioned | `lib/widgets/badge_avatar.dart` |
| ListView vs. ListView.builder | `lib/pages/layout_page.dart` (ListView), `lib/widgets/course_list.dart` (builder) |
| A Lazy List of ListTiles | `lib/widgets/course_list.dart` |
| A Two-Column Grid | `lib/widgets/course_grid.dart`, `lib/widgets/course_card.dart` |
| Theming with a Seed Color; Light and Dark Themes | `lib/theme/app_theme.dart`, `lib/app.dart`, `lib/widgets/theme_mode_picker.dart` |
| Colors Have Jobs | `lib/widgets/color_roles_panel.dart`, `lib/widgets/role_swatch.dart` |
| Material 3 in Use | `lib/widgets/category_chips.dart`, `lib/widgets/course_card.dart`, `lib/pages/home_page.dart` |
| Bundling Images and Fonts; Declaring Assets | `pubspec.yaml`, `assets/images/`, `fonts/` |
| Designing for Every Screen; Adapting with LayoutBuilder | `lib/pages/courses_page.dart`, `lib/theme/breakpoints.dart` |
| An Accessibility Checklist | `semanticLabel` and `tooltip` in `home_page.dart` and `profile_page.dart`, `Semantics` in `badge_avatar.dart` |

## Try this in class

1. In `profile_row.dart`, remove the `Expanded` around the Column and use a very long name. Read the overflow message in the debug console.
2. In `app_theme.dart`, change `seed` to `Colors.teal` and hot reload. Every color role changes with it.
3. Run on Chrome or Windows and resize the window across 600 and 840 pixels. The Courses tab switches from a list to 2 and then 3 columns.
4. In `course_grid.dart`, replace `GridView.count` with `GridView.builder` and a `SliverGridDelegateWithFixedCrossAxisCount`.
5. In `lifecycle_clock.dart`, comment out `_timer.cancel()`, switch tabs, and read the error about calling `setState` after `dispose`.
6. Turn on large text in the phone's settings and check which screens still fit.

## License

Code: CC BY-NC-ND 4.0, Experimental Course Module | Reviewed by J.D. Macam.
IBM Plex Sans: Copyright IBM Corp., SIL Open Font License 1.1 (`fonts/OFL.txt`). Flutter, Dart, and Material Design are trademarks of Google LLC.
