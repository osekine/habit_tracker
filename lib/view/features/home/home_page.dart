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
  Widget build(BuildContext context) => ValueListenableBuilder(
    valueListenable: widget.vm.habits,
    builder:
        (_, habits, __) => Scaffold(
          appBar: AppBar(
            actions: [
              HabitIconButton(
                onTap: () async {
                  // TODO(NLU): change to GoRouter
                  await Navigator.of(context).pushReplacementNamed('/edit');
                },
                icon: Icons.edit,
              ),
            ],
          ),
          body: RefreshIndicator(
            onRefresh: widget.vm.load,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Center(
                child: Column(
                  children: [
                    for (final habit in habits) YearHabitWidget(vm: habit),
                  ],
                ),
              ),
            ),
          ),
          floatingActionButton:
              widget.vm.habits.value.isEmpty
                  ? null
                  : FloatingActionButton(
                    onPressed: () async {
                      await widget.vm.archiveHabits();
                      setState(() {});
                    },
                    child: const Icon(Icons.delete),
                  ),
        ),
  );
}
