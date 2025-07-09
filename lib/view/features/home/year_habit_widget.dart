import 'package:flutter/material.dart';
import 'package:habit_tracker/view/features/home/progress_button.dart';
import 'package:habit_tracker/view/features/home/year_activity_widget.dart';
import 'package:habit_tracker/view/widgets/dumb_button.dart';
import 'package:habit_tracker/view_model/view_model.dart';

class YearHabitWidget extends StatelessWidget {
  final IYearHabitViewModel vm;
  const YearHabitWidget({required this.vm, super.key});

  @override
  Widget build(BuildContext context) {
    const shadowColor = Colors.black38;

    return Padding(
      padding: const EdgeInsets.all(8),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: shadowColor),
          boxShadow: const [
            BoxShadow(blurRadius: 5, offset: Offset(0, 5), color: shadowColor),
          ],
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
                        children: [
                          Text(
                            vm.name,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            vm.description ?? '',
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ProgressButton(vm: vm.today),
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
}
