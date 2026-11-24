// Slide: "Anatomy of a Scaffold".
// The Scaffold gives the screen its AppBar (title and actions), body,
// FloatingActionButton (the screen's primary action), and NavigationBar
// (switches between top-level pages). It also hosts snack bars and dialogs.
import 'package:flutter/material.dart';

import 'courses_page.dart';
import 'layout_page.dart';
import 'profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    required this.themeMode,
    required this.onThemeModeChanged,
  });

  final ThemeMode themeMode;
  final ValueChanged<ThemeMode> onThemeModeChanged;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _tab = 0;

  static const _titles = ['Courses', 'Layout', 'Me'];

  void _showAbout() {
    showAboutDialog(
      context: context,
      applicationName: 'Campus Courses',
      applicationVersion: 'MOBPROG Module 02 demo',
      applicationIcon: Image.asset(
        'assets/images/logo.png',
        width: 48,
        height: 48,
        semanticLabel: 'Course logo',
      ),
      applicationLegalese: 'CC BY-NC-ND 4.0',
    );
  }

  void _addCourse() {
    // ScaffoldMessenger.of(context) finds the nearest messenger above this
    // widget in the tree (slide: "What Is BuildContext?").
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Adding courses comes in a later lab.')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Widget page = switch (_tab) {
      0 => const CoursesPage(),
      1 => const LayoutPage(),
      _ => ProfilePage(
          themeMode: widget.themeMode,
          onThemeModeChanged: widget.onThemeModeChanged,
        ),
    };

    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_tab]),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            tooltip: 'About this demo',
            onPressed: _showAbout,
          ),
        ],
      ),
      body: page,
      floatingActionButton: _tab == 0
          ? FloatingActionButton(
              onPressed: _addCourse,
              tooltip: 'Add course',
              child: const Icon(Icons.add),
            )
          : null,
      bottomNavigationBar: NavigationBar(
        selectedIndex: _tab,
        onDestinationSelected: (index) => setState(() => _tab = index),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.school_outlined),
            selectedIcon: Icon(Icons.school),
            label: 'Courses',
          ),
          NavigationDestination(
            icon: Icon(Icons.dashboard_outlined),
            selectedIcon: Icon(Icons.dashboard),
            label: 'Layout',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Me',
          ),
        ],
      ),
    );
  }
}
