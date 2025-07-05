import 'package:flutter/material.dart';
import 'package:habit_tracker/view/widgets/year_habit_widget.dart';
import 'package:habit_tracker/view_model/view_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) =>
      Scaffold(body: Center(child: YearHabitWidget(vm: stubYear)));
}
