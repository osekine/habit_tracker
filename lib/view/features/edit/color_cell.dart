import 'package:flutter/material.dart';
import 'package:habit_tracker/theme/habit_colors.dart';

class ColorCell extends StatelessWidget {
  final double size;
  final Color color;
  final bool isChosen;
  const ColorCell({
    super.key,
    required this.size,
    required this.color,
    this.isChosen = false,
  });

  @override
  Widget build(BuildContext context) => SizedBox(
    height: size,
    width: size,
    child: DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: color,
      ),
      child:
          isChosen
              ? Padding(
                padding: const EdgeInsets.all(16),
                child: SizedBox(
                  height: size / 2,
                  width: size / 2,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: HabitColors.white.baseColor,
                    ),
                  ),
                ),
              )
              : const SizedBox.shrink(),
    ),
  );
}
