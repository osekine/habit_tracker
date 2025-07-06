import 'package:flutter/material.dart';
import 'package:habit_tracker/theme/habit_color.dart';
import 'package:habit_tracker/view/features/home/day_habit_widget.dart';
import 'package:habit_tracker/view/features/home/empty_day_widget.dart';
import 'package:habit_tracker/view_model/view_model.dart';

class YearActivityWidget extends StatefulWidget {
  final IYearHabitViewModel vm;
  const YearActivityWidget({required this.vm, super.key});

  @override
  State<YearActivityWidget> createState() => _YearActivityWidgetState();
}

class _YearActivityWidgetState extends State<YearActivityWidget> {
  late final List<IDayHabitViewModel> days;
  late final HabitColor baseColor;

  @override
  void initState() {
    super.initState();
    days = widget.vm.days;
    baseColor = widget.vm.baseColor;
  }

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: [
        for (var x = 51; x >= 0; --x)
          Column(
            children: [
              for (var y = 6; y >= 0; --y) _dayWidgetBuilder(7 * x + y),
            ],
          ),
      ],
    ),
  );

  Widget _dayWidgetBuilder(int dayCount) {
    final isDayActive = dayCount < days.length;
    final inactiveColor = baseColor.inactiveColor;

    return isDayActive
        ? DayHabitWidget(vm: days[dayCount])
        : EmptyDayWidget(color: inactiveColor);
  }
}
