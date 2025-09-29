import 'package:flutter/material.dart';
import 'package:habit_tracker/theme/habit_colors.dart';

class HabitIconButton extends StatelessWidget {
  final VoidCallback onTap;
  final Icon icon;
  final Color backgroundColor;
  final Widget? child;
  final double size;
  final bool needBorder;

  const HabitIconButton({
    required this.onTap,
    required this.icon,
    this.child,
    this.backgroundColor = Colors.transparent,
    this.size = 40,
    this.needBorder = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) => InkWell(
    onTap: onTap,
    child: DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border:
            needBorder
                ? Border.all(
                  color: ColorCollection.monocrome['gray']!.baseColor,
                )
                : null,
        color: backgroundColor,
      ),
      child: Padding(padding: EdgeInsets.all(size * 0.25), child: icon),
    ),
  );
}
