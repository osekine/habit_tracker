import 'package:flutter/material.dart';
import 'package:habit_tracker/theme/habit_colors.dart';

import 'package:habit_tracker/view/widgets/habit_icon_button.dart';
import 'package:habit_tracker/view_model/view_model.dart';

class ProgressButton extends StatefulWidget {
  final IDayHabitViewModel vm;
  const ProgressButton({required this.vm, super.key});

  @override
  State<ProgressButton> createState() => _ProgressButtonState();
}

class _ProgressButtonState extends State<ProgressButton> {
  @override
  Widget build(BuildContext context) => ValueListenableBuilder(
    valueListenable: widget.vm.isDone,
    builder:
        // TODO(NLU): add animation
        (_, isDone, __) => SizedBox.square(
          dimension: 48,
          child: HabitIconButton(
            backgroundColor: widget.vm.color,
            onTap: widget.vm.add,
            icon: Icon(
              widget.vm.treshold == 1 ? Icons.check : Icons.add,
              color:
                  isDone
                      ? ColorCollection.monocrome['white']!.baseColor
                      : ColorCollection.monocrome['black']!.baseColor,
            ),
          ),
        ),
  );
}
