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
            border: Border.all(color: HabitColors.gray.baseColor),
            borderRadius: BorderRadius.circular(8),
            color:
                isChosen
                    ? HabitColors.anthracite.baseColor
                    : HabitColors.white.baseColor,
          ),
          child: GestureDetector(
            onTap: vm.switchChosen,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  const SizedBox.square(dimension: 24),
                  Expanded(
                    child: Text(
                      vm.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color:
                            isChosen
                                ? HabitColors.white.color
                                : HabitColors.black.color,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
  );
}
