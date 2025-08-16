import 'package:flutter/material.dart';
import 'package:habit_tracker/theme/habit_colors.dart';
import 'package:habit_tracker/view/features/categories/habit_category_widget.dart';
import 'package:habit_tracker/view_model/view_model.dart';

class CategoriesHeader extends SliverPersistentHeaderDelegate {
  final List<ICategoryViewModel> categories;

  @override
  final double minExtent;

  @override
  final double maxExtent;

  const CategoriesHeader({required double extent, required this.categories})
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
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, i) => HabitCategoryWidget(vm: categories[i]),
        itemCount: categories.length,
      ),
    ),
  );
}
