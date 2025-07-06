import 'package:flutter/material.dart';
import 'package:habit_tracker/view/features/home/year_activity_widget.dart';
import 'package:habit_tracker/view/widgets/dumb_button.dart';
import 'package:habit_tracker/view_model/view_model.dart';

class YearHabitWidget extends StatelessWidget {
  final IYearHabitViewModel vm;
  const YearHabitWidget({required this.vm, super.key});

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(8),
    child: DecoratedBox(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(),
        boxShadow: const [BoxShadow(blurRadius: 5, offset: Offset(0, 5))],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                const DumbButton(),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Text(vm.name), Text(vm.description ?? '')],
                    ),
                  ),
                ),
                const DumbButton(),
              ],
            ),
            const SizedBox(height: 8),
            YearActivityWidget(vm: vm),
          ],
        ),
      ),
    ),
  );
}
