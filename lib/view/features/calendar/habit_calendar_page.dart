import 'package:flutter/material.dart';
import 'package:habit_tracker/navigation/router.dart';
import 'package:habit_tracker/view/features/home/year_habit_widget.dart';
import 'package:habit_tracker/view/widgets/habit_icon_button.dart';
import 'package:habit_tracker/view_model/view_model.dart';
import 'package:table_calendar/table_calendar.dart';

class HabitCalendarPage extends StatefulWidget {
  final IHomePageViewModel vm;
  final void Function()? onUpdate;
  final int habitId;
  const HabitCalendarPage({
    super.key,
    required this.vm,
    this.onUpdate,
    required this.habitId,
  });

  static Future<void> showAsModalBottomSheet(
    BuildContext context, {
    required IHomePageViewModel vm,
    required int habitId,
    void Function()? onUpdate,
  }) => showModalBottomSheet(
    context: context,
    builder:
        (_) => HabitCalendarPage(vm: vm, onUpdate: onUpdate, habitId: habitId),
    isScrollControlled: true,
  );

  @override
  State<HabitCalendarPage> createState() => _HabitCalendarPageState();
}

class _HabitCalendarPageState extends State<HabitCalendarPage> {
  final DateTime firstCalendarDay = DateTime.now().copyWith(
    year: DateTime.now().year - 1,
  );
  final DateTime lastCalendarDay = DateTime.now();
  final focusedDay = DateTime.now();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => ValueListenableBuilder(
    valueListenable: widget.vm.habits,
    builder: (_, habits, __) {
      final vm = habits.firstWhere((newHabit) => newHabit.id == widget.habitId);
      return Padding(
        padding: const EdgeInsets.all(8),
        child: ValueListenableBuilder(
          valueListenable: vm.days,
          builder:
              (_, doneDays, __) => Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  YearHabitWidget(vm: vm),
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: HabitIconButton(
                      onTap: () async {
                        final isHabitUpdated = await EditRoute(
                          vm,
                        ).push<bool>(context);

                        if (isHabitUpdated ?? false) widget.onUpdate?.call();
                      },
                      icon: const Icon(Icons.edit),
                      size: 16,
                      needBorder: true,
                    ),
                  ),
                  const Divider(height: 32),
                  TableCalendar(
                    focusedDay: focusedDay,
                    firstDay: firstCalendarDay,
                    lastDay: lastCalendarDay,
                    onDaySelected: (selectedDay, focusedDay) {
                      vm.updateDayProgress(day: selectedDay);
                      setState(() {});
                    },
                    startingDayOfWeek: StartingDayOfWeek.monday,
                    availableCalendarFormats: const {
                      CalendarFormat.month: 'Month',
                    },
                    selectedDayPredicate:
                        (day) => doneDays.any(
                          (habit) =>
                              DateUtils.isSameDay(habit.day, day) &&
                              habit.isDone.value,
                        ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
        ),
      );
    },
  );
}
