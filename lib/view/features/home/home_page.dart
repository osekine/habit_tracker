import 'package:flutter/material.dart';
import 'package:habit_tracker/view/features/home/year_habit_widget.dart';
import 'package:habit_tracker/view/widgets/habit_icon_button.dart';
import 'package:habit_tracker/view_model/view_model.dart';

class HomePage extends StatefulWidget {
  final IHomePageViewModel vm;
  const HomePage({super.key, required this.vm});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      actions: [
        HabitIconButton(
          onTap: () async {
            // TODO(NLU): change to GoRouter
            await Navigator.of(context).pushNamed('/edit');
            widget.vm.load();
            // TODO(NLU): fix
            setState(() {});
          },
          icon: Icons.edit,
        ),
      ],
    ),
    body: SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            for (final habit in widget.vm.habits) YearHabitWidget(vm: habit),
          ],
        ),
      ),
    ),
    floatingActionButton:
        widget.vm.habits.isEmpty
            ? null
            : FloatingActionButton(
              onPressed: () async {
                await widget.vm.archiveHabits();
                setState(() {});
              },
              child: const Icon(Icons.delete),
            ),
  );
}
