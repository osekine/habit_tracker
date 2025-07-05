import 'package:flutter/material.dart';
import 'package:habit_tracker/view/widgets/dumb_button.dart';

class YearHabitWidget extends StatelessWidget {
  const YearHabitWidget({super.key});

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
            const Row(
              children: [
                DumbButton(),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Text('Habit Name'), Text('Habit description')],
                    ),
                  ),
                ),
                DumbButton(),
              ],
            ),
            const SizedBox(height: 8),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (var i = 0; i < 52; ++i)
                    Column(
                      children: [
                        for (var i = 0; i < 5; ++i) const DayHabitWidget(),
                      ],
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

class DayHabitWidget extends StatelessWidget {
  const DayHabitWidget({super.key});

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(2),
    child: Container(
      height: 10,
      width: 10,
      decoration: BoxDecoration(
        color: Colors.amberAccent,
        borderRadius: BorderRadius.circular(2),
      ),
    ),
  );
}
