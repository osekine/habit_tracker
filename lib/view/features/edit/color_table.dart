import 'package:flutter/material.dart';
import 'package:habit_tracker/theme/habit_colors.dart';
import 'package:habit_tracker/view/features/edit/color_cell.dart';

class ColorTable extends StatefulWidget {
  final void Function(String)? onColorChangeCallback;
  const ColorTable({super.key, this.onColorChangeCallback});

  @override
  State<ColorTable> createState() => _ColorTableState();
}

class _ColorTableState extends State<ColorTable> {
  final _colorIndex = ValueNotifier<int>(0);

  @override
  void initState() {
    super.initState();

    _onChangeColor();
    _colorIndex.addListener(_onChangeColor);
  }

  @override
  Widget build(BuildContext context) {
    const spacing = 16.0;
    const cellSize = 54.0;

    const rowsCount = 4;
    final columnsCount = ColorCollection.habits.length ~/ rowsCount;
    return ValueListenableBuilder(
      valueListenable: _colorIndex,
      builder:
          (_, chosenColor, __) => Column(
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
                      GestureDetector(
                        onTap: () {
                          _colorIndex.value = columnsCount * y + x;
                        },
                        child: ColorCell(
                          size: cellSize,
                          color:
                              ColorCollection.habits.values
                                  .toList()[columnsCount * y + x]
                                  .baseColor,
                          isChosen: columnsCount * y + x == chosenColor,
                        ),
                      ),
                  ],
                ),
                if (y < rowsCount - 1) const SizedBox(height: spacing),
              ],
            ],
          ),
    );
  }

  void _onChangeColor() {
    final onColorChange = widget.onColorChangeCallback ?? (_) {};

    final newColorName =
        ColorCollection.habits.keys.toList()[_colorIndex.value];
    onColorChange(newColorName);
  }
}
