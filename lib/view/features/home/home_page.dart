import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:habit_tracker/navigation/router.dart';
import 'package:habit_tracker/theme/habit_colors.dart';
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
              !kDebugMode && widget.vm.habits.value.isEmpty
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

class HomePageHeader extends SliverPersistentHeaderDelegate {
  final FutureOr<void> Function()? onEditTap;

  @override
  final double maxExtent;

  @override
  final double minExtent;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;

  const HomePageHeader({
    required double maxExtent,
    required double minExtent,
    this.onEditTap,
  }) : minExtent = minExtent + kToolbarHeight,
       maxExtent = maxExtent + kToolbarHeight;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) => ColoredBox(
    color: ColorCollection.monocrome['white']!.baseColor.withAlpha(255),
    child: Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
        child: SizedBox.square(
          dimension: 40,
          child: HabitIconButton(
            onTap: onEditTap ?? () {},
            icon: const Icon(Icons.edit),
          ),
        ),
      ),
    ),
  );
}
