import 'package:flutter/material.dart';
import 'package:habit_tracker/view/features/home/year_habit_widget.dart';
import 'package:habit_tracker/view_model/view_model.dart';
import 'package:table_calendar/table_calendar.dart';

class HabitCalendarPage extends StatefulWidget {
  final IYearHabitViewModel vm;
  const HabitCalendarPage({super.key, required this.vm});

  static Future<void> showAsModalBottomSheet(
    BuildContext context, {
    required IYearHabitViewModel vm,
  }) => showModalBottomSheet(
    context: context,
    builder: (_) => HabitCalendarPage(vm: vm),
    isScrollControlled: true,
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
  final focusedDay = DateTime.now();

  @override
  void initState() {
    super.initState();
    vm = widget.vm;
  }

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(8),
    child: ValueListenableBuilder(
      valueListenable: vm.days,
      builder:
          (_, doneDays, __) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              YearHabitWidget(vm: vm),
              const Divider(height: 32),
              TableCalendar(
                focusedDay: focusedDay,
                firstDay: firstCalendarDay,
                lastDay: lastCalendarDay,
                // headerVisible: false,
                onDaySelected: (selectedDay, focusedDay) {
                  vm.updateDayProgress(day: selectedDay);
                  setState(() {});
                },
                startingDayOfWeek: StartingDayOfWeek.monday,
                availableCalendarFormats: const {CalendarFormat.month: 'Month'},
                selectedDayPredicate:
                    (day) => doneDays.any(
                      (habit) =>
                          DateUtils.isSameDay(habit.day, day) &&
                          habit.isDone.value,
                    ),
                // calendarBuilders: CalendarBuilders(),
              ),
              const SizedBox(height: 16),
            ],
          ),
    ),
  );
}
