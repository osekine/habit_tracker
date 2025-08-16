import 'dart:async';
import 'package:flutter/material.dart';
import 'package:habit_tracker/theme/habit_colors.dart';
import 'package:habit_tracker/view/widgets/habit_icon_button.dart';

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
