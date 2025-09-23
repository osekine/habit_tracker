import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:habit_tracker/navigation/router.dart';
import 'package:habit_tracker/theme/habit_colors.dart';
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
  Widget build(BuildContext context) => ValueListenableBuilder(
    valueListenable: widget.vm.habits,
    builder:
        (_, habits, __) => Scaffold(
          backgroundColor: ColorCollection.monocrome['white']!.baseColor
              .withAlpha(255),
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
          body: RefreshIndicator(
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
                  delegate: CategoriesHeader(
                    extent: 32,
                    vm: widget.vm,
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate([
                    Center(
                      child: Column(
                        children: [
                          for (final habit in habits)
                            YearHabitWidget(vm: habit),
                        ],
                      ),
                    ),
                  ]),
                ),
              ],
            ),
          ),
        ),
  );
}
