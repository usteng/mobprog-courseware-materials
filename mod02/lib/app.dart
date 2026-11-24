// Slide: "Light and Dark Themes" (app.dart).
// The root widget. It owns the theme mode, so it is a StatefulWidget: when the
// user picks Light or Dark on the Me tab, setState here rebuilds the whole app.
import 'package:flutter/material.dart';

import 'pages/home_page.dart';
import 'theme/app_theme.dart';

class CourseApp extends StatefulWidget {
  const CourseApp({super.key});

  @override
  State<CourseApp> createState() => _CourseAppState();
}

class _CourseAppState extends State<CourseApp> {
  // ThemeMode.system follows the phone's light or dark setting.
  ThemeMode _themeMode = ThemeMode.system;

  void _changeThemeMode(ThemeMode mode) => setState(() => _themeMode = mode);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Campus Courses',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: _themeMode, //default
      home: HomePage(
        themeMode: _themeMode,
        onThemeModeChanged: _changeThemeMode,
      ),
    );
  }
}
