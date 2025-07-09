import 'dart:async';
import 'package:flutter/material.dart';
import 'package:habit_tracker/theme/habit_colors.dart';
import 'package:habit_tracker/view/widgets/habit_icon_button.dart';
import 'package:habit_tracker/view_model/view_model.dart';

class EditPageHeader extends SliverPersistentHeaderDelegate {
  final IEditPageViewModel vm;

  final FutureOr<void> Function()? onCrossTap;
  final FutureOr<void> Function()? onApplyTap;

  @override
  final double maxExtent;

  @override
  final double minExtent;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;

  const EditPageHeader({
    required double maxExtent,
    required double minExtent,
    required this.vm,
    this.onCrossTap,
    this.onApplyTap,
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
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox.square(
              dimension: 40,
              child: HabitIconButton(
                onTap: onCrossTap ?? () {},
                icon: const Icon(Icons.close),
              ),
            ),
            SizedBox.square(
              dimension: 40,
              child: HabitIconButton(
                onTap: onApplyTap ?? () {},
                icon: const Icon(Icons.check),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
