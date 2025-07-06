import 'package:flutter/material.dart';

class HabitIconButton extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  final Color backgroundColor;
  final Widget? child;

  const HabitIconButton({
    required this.onTap,
    required this.icon,
    this.child,
    this.backgroundColor = Colors.transparent,
    super.key,
  });

  @override
  Widget build(BuildContext context) => InkWell(
    onTap: onTap,
    child: DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: backgroundColor,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          if(child != null) child!,
          Icon(icon),
        ],
      ),
    ),
  );
}
