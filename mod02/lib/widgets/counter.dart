// Slide: "Changing the Screen with setState" (counter.dart).
// setState marks the widget dirty, so build() runs again.
// A leading _ makes a name private to its file.
import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => setState(() => _count++),
      child: Text('Tapped $_count times'),
    );
  }
}
