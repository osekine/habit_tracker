import 'package:flutter/material.dart';
import 'package:habit_tracker/view_model/view_model.dart';

class DayHabitWidget extends StatelessWidget {
  final IDayHabitViewModel? vm;
  final double size;
  final Color color;
  
  const DayHabitWidget({
    required this.color,
    this.vm,
    this.size = 10,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(2),
    child: Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(2),
      ),
    ),
  );
}
