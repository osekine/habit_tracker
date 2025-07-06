import 'package:flutter/material.dart';
import 'package:habit_tracker/view_model/view_model.dart';

class DayHabitWidget extends StatelessWidget {
  final IDayHabitViewModel vm;
  final double size;

  const DayHabitWidget({required this.vm, this.size = 10, super.key});

  @override
  Widget build(BuildContext context) => ValueListenableBuilder(
    valueListenable: vm.count,
    builder:
        (_, count, __) => Padding(
          padding: const EdgeInsets.all(2),
          child: Container(
            height: size,
            width: size,
            decoration: BoxDecoration(
              color: vm.color,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ),
  );
}
