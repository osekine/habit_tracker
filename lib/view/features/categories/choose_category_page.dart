import 'package:flutter/material.dart';
import 'package:habit_tracker/view_model/i_category_view_model.dart';

class ChooseCategoryPage extends StatelessWidget {
  final List<ICategoryViewModel> categories;
  const ChooseCategoryPage({required this.categories, super.key});

  static Future<void> showAsModalBottomSheet(
    BuildContext context, {
    required List<ICategoryViewModel> categories,
  }) => showModalBottomSheet(
    context: context,
    builder: (context) => ChooseCategoryPage(categories: categories),
  );

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.sizeOf(context).width - 16;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: GridView.custom(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 3,
          ),
          childrenDelegate: SliverChildListDelegate.fixed(
            categories.map((category) => Text(category.title)).toList(),
          ),
        ),
      ),
    );
  }
}
