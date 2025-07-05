import 'package:flutter/material.dart';
import 'package:habit_tracker/theme/habit_colors.dart';

class ColorCell extends StatefulWidget {
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
  State<ColorCell> createState() => _ColorCellState();
}

class _ColorCellState extends State<ColorCell> {
  bool isChosen = false;

  @override
  void initState() {
    super.initState();
    isChosen = widget.isChosen;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    isChosen = widget.isChosen;
  }

  @override
  void didUpdateWidget(covariant ColorCell oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isChosen != oldWidget.isChosen) {
      isChosen = widget.isChosen;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) => SizedBox(
    height: widget.size,
    width: widget.size,
    child: DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: widget.color,
      ),
      child: AnimatedPadding(
        padding: EdgeInsets.all(isChosen ? 16 : widget.size),
        duration: const Duration(milliseconds: 150),
        curve: Curves.easeInOut,
        child:
            isChosen
                ? SizedBox(
                  height: widget.size / 2,
                  width: widget.size / 2,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: HabitColors.white.baseColor,
                    ),
                  ),
                )
                : const SizedBox.shrink(),
      ),
    ),
  );
}
