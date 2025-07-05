import 'package:flutter/material.dart';
import 'package:habit_tracker/view/features/home/home_page.dart';

void main() {
  runApp(const HabitTrackerApp());
}

class HabitTrackerApp extends StatelessWidget {
  const HabitTrackerApp({super.key});

  @override
  Widget build(BuildContext context) => const MaterialApp(
    home: HomePage(),
  );
}
