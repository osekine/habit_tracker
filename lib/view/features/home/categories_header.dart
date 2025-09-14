import 'package:flutter/material.dart';
import 'package:habit_tracker/theme/habit_colors.dart';
import 'package:habit_tracker/view/features/categories/habit_category_widget.dart';
import 'package:habit_tracker/view_model/view_model.dart';

class CategoriesHeader extends SliverPersistentHeaderDelegate {
  final IHomePageViewModel vm;

  @override
  final double minExtent;

  @override
  final double maxExtent;

  const CategoriesHeader({required double extent, required this.vm})
    : minExtent = extent,
      maxExtent = extent;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) => ColoredBox(
    color: HabitColors.white.color,
    child: Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 2),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, i) {
          final thisCategory = vm.activeCategories[i];
          return HabitCategoryWidget(
            vm: thisCategory,
            onTap: vm.filterHabits,
            isChosen: vm.chosenCategory == thisCategory,
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 4),
        itemCount: vm.activeCategories.length,
      ),
    ),
  );
}
