import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:habit_tracker/navigation/router.dart';
import 'package:habit_tracker/theme/habit_colors.dart';
import 'package:habit_tracker/view/features/calendar/habit_calendar_page.dart';
import 'package:habit_tracker/view/features/home/categories_header.dart';
import 'package:habit_tracker/view/features/home/home_page_header.dart';
import 'package:habit_tracker/view/features/home/year_habit_widget.dart';
import 'package:habit_tracker/view_model/view_model.dart';

class HomePage extends StatefulWidget {
  final IHomePageViewModel vm;
  const HomePage({super.key, required this.vm});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    unawaited(widget.vm.load());
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: ColorCollection.monocrome['white']!.baseColor.withAlpha(
      255,
    ),
    floatingActionButton:
        !kDebugMode
            ? null
            : FloatingActionButton(
              onPressed: () async {
                await widget.vm.archiveHabits();
                setState(() {});
              },
              child: const Icon(Icons.delete),
            ),
    body: ValueListenableBuilder(
      valueListenable: widget.vm.habits,
      builder:
          (_, habits, __) => RefreshIndicator(
            onRefresh: widget.vm.load,
            child: CustomScrollView(
              slivers: [
                SliverPersistentHeader(
                  pinned: true,
                  delegate: HomePageHeader(
                    maxExtent: 70,
                    minExtent: 50,
                    onEditTap: () => const EditRoute().go(context),
                  ),
                ),
                SliverPersistentHeader(
                  pinned: true,
                  delegate: CategoriesHeader(extent: 32, vm: widget.vm),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate((_, index) {
                    final habit = habits[index];
                    return Center(
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap:
                                () async =>
                                    HabitCalendarPage.showAsModalBottomSheet(
                                      context,
                                      vm: habit,
                                    ),
                            child: YearHabitWidget(vm: habit),
                          ),
                        ],
                      ),
                    );
                  }, childCount: habits.length,),
                ),
              ],
            ),
          ),
    ),
  );
}
