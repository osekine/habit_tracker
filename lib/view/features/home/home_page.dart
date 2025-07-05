import 'package:flutter/material.dart';
import 'package:habit_tracker/view/features/home/year_habit_widget.dart';
import 'package:habit_tracker/view/widgets/habit_icon_button.dart';
import 'package:habit_tracker/view_model/view_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      actions: [
        HabitIconButton(
          onTap: () async {
            // TODO(NLU): change to GoRouter
            await Navigator.of(context).pushNamed('/edit');
          },
          icon: Icons.edit,
        ),
      ],
    ),
    body: Center(child: YearHabitWidget(vm: stubYear)),
  );
}
