import 'package:flutter/material.dart';

class EmptyDayWidget extends StatelessWidget {
  final double size;
  final Color color;
  const EmptyDayWidget({super.key, this.size = 10, required this.color});

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(2),
    child: Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(2),
      ),
    ),
  );
}
