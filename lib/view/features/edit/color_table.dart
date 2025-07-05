import 'package:flutter/material.dart';
import 'package:habit_tracker/theme/habit_colors.dart';

class ColorTable extends StatelessWidget {
  const ColorTable({super.key});

  @override
  Widget build(BuildContext context) {
    const spacing = 16.0;
    const cellSize = 54.0;

    const rowsCount = 4;
    final columnsCount = ColorCollection.habits.length ~/ rowsCount;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Color'),
        const SizedBox(height: 12),
        for (int y = 0; y < rowsCount; ++y) ...[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: spacing,
            children: [
              for (int x = 0; x < columnsCount; ++x)
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color:
                        ColorCollection.habits[columnsCount * y + x].baseColor,
                  ),
                  height: cellSize,
                  width: cellSize,
                ),
            ],
          ),
          if (y < rowsCount - 1) const SizedBox(height: spacing),
        ],
      ],
    );
  }
}
