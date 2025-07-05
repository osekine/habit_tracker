import 'package:flutter/material.dart';
import 'package:habit_tracker/view/widgets/day_habit_widget.dart';
import 'package:habit_tracker/view_model/view_model.dart';

class YearActivityWidget extends StatelessWidget {
  final List<IDayHabitViewModel> days;
  const YearActivityWidget({required this.days, super.key});

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: [
        for (var x = 51; x >= 0; --x)
          Column(
            children: [
              for (var y = 6; y >= 0; --y)
                DayHabitWidget(
                  vm:
                      (7*x+y) < days.length
                          ? days[7*x+y]
                          : null,
                ),
            ],
          ),
      ],
    ),
  );
}
