import 'package:flutter/material.dart';
import 'package:habit_tracker/theme/habit_colors.dart';
import 'package:habit_tracker/view_model/view_model.dart';

class HabitCategoryWidget extends StatelessWidget {
  final ICategoryViewModel vm;
  const HabitCategoryWidget({required this.vm, super.key});

  @override
  Widget build(BuildContext context) => ValueListenableBuilder(
    valueListenable: vm.isChosen,
    builder:
        (context, isChosen, _) => DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color:
                isChosen
                    ? HabitColors.anthracite.baseColor
                    : HabitColors.gray.baseColor,
          ),
          child: Row(
            children: [const SizedBox.square(dimension: 24), Text(vm.title)],
          ),
        ),
  );
}
