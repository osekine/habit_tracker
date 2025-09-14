import 'package:flutter/material.dart';
import 'package:habit_tracker/theme/habit_colors.dart';
import 'package:habit_tracker/view_model/view_model.dart';

class HabitCategoryWidget extends StatelessWidget {
  final ICategoryViewModel vm;
  final void Function(ICategoryViewModel?)? onTap;
  final bool? isChosen;
  const HabitCategoryWidget({
    required this.vm,
    this.onTap,
    this.isChosen,
    super.key,
  });

  @override
  Widget build(BuildContext context) => ValueListenableBuilder(
    valueListenable: vm.isChosen,
    builder: (context, vmIsChosen, _) {
      final chosen = isChosen ?? vmIsChosen;
      return DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(color: HabitColors.gray.baseColor),
          borderRadius: BorderRadius.circular(8),
          color:
              chosen
                  ? HabitColors.anthracite.baseColor
                  : HabitColors.white.baseColor,
        ),
        child: GestureDetector(
          onTap: () {
            // TODO(NLU): think about it
            onTap == null
                ? vm.switchChosen()
                : onTap?.call(!chosen ? vm : null);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox.square(dimension: 24),
                Flexible(
                  child: Text(
                    vm.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color:
                          chosen
                              ? HabitColors.white.color
                              : HabitColors.black.color,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
