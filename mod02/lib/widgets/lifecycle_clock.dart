// Slide: "initState, build, and dispose".
// initState runs once at creation (start the timer here), build runs on every
// rebuild, and dispose runs once at removal (stop the timer here).
import 'dart:async';

import 'package:flutter/material.dart';

class LifecycleClock extends StatefulWidget {
  const LifecycleClock({super.key});

  @override
  State<LifecycleClock> createState() => _LifecycleClockState();
}

class _LifecycleClockState extends State<LifecycleClock> {
  late final Timer _timer;
  int _seconds = 0;

  @override
  void initState() {
    super.initState();
    debugPrint('LifecycleClock: initState');
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (_) => setState(() => _seconds++),
    );
  }

  @override
  void dispose() {
    debugPrint('LifecycleClock: dispose');
    _timer.cancel(); // without this, the timer keeps running after removal
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.timer_outlined),
      title: Text('This tab has been open for $_seconds s'),
      subtitle: const Text('build() runs once per second while it is open.'),
    );
  }
}
