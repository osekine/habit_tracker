import 'package:flutter/material.dart';
import 'package:habit_tracker/view/features/home/year_habit_widget.dart';
import 'package:habit_tracker/view_model/view_model.dart';
import 'package:table_calendar/table_calendar.dart';

class HabitCalendarPage extends StatefulWidget {
  final IYearHabitViewModel vm;
  const HabitCalendarPage({super.key, required this.vm});

  static void showAsModalBottomSheet(
    BuildContext context, {
    required IYearHabitViewModel vm,
  }) => showBottomSheet(
    context: context,
    builder: (_) => HabitCalendarPage(vm: vm),
  );

  @override
  State<HabitCalendarPage> createState() => _HabitCalendarPageState();
}

class _HabitCalendarPageState extends State<HabitCalendarPage> {
  late final IYearHabitViewModel vm;
  final DateTime firstCalendarDay = DateTime.now().copyWith(
    year: DateTime.now().year - 1,
  );
  final DateTime lastCalendarDay = DateTime.now();
  final focusedCalendarDay = ValueNotifier<DateTime>(DateTime.now());

  @override
  void initState() {
    super.initState();
    vm = widget.vm;
  }

  @override
  Widget build(BuildContext context) => ListView(
    children: [
      YearHabitWidget(vm: vm),
      const Text('Заглушка'),
      ValueListenableBuilder(
        valueListenable: focusedCalendarDay,
        builder:
            (_, focusedDay, __) => TableCalendar(
              focusedDay: focusedDay,
              firstDay: firstCalendarDay,
              lastDay: lastCalendarDay,
            ),
      ),
    ],
  );
}
