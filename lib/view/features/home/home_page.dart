import 'package:flutter/material.dart';
import 'package:habit_tracker/view/widgets/year_habit_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: Center(child: YearHabitWidget()));
}
