import 'package:flutter/material.dart';

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
  Widget build(BuildContext context) => HabitIconButton(
    backgroundColor: widget.vm.color,
    onTap: widget.vm.add,
    icon: widget.vm.isDone ? Icons.check : Icons.add,
  );
}
