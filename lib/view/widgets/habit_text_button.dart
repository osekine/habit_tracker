import 'package:flutter/material.dart';
import 'package:habit_tracker/theme/habit_colors.dart';

class HabitTextButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final Color backgroundColor;
  final Widget? child;
  final bool needBorder;

  const HabitTextButton({
    required this.onTap,
    required this.text,
    this.child,
    this.backgroundColor = const Color.fromRGBO(0, 0, 0, 0),
    this.needBorder = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) => DecoratedBox(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      border:
          needBorder
              ? Border.all(color: ColorCollection.monocrome['gray']!.baseColor)
              : null,
      color: backgroundColor,
    ),
    child: InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
    ),
  );
}
