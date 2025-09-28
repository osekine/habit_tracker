import 'package:flutter/material.dart';
import 'package:habit_tracker/view/features/categories/habit_category_widget.dart';
import 'package:habit_tracker/view/widgets/habit_text_button.dart';
import 'package:habit_tracker/view_model/view_model.dart';

class ChooseCategoryPage extends StatelessWidget {
  final IEditPageViewModel vm;
  const ChooseCategoryPage({required this.vm, super.key});

  static Future<void> showAsModalBottomSheet(
    BuildContext context, {
    required IEditPageViewModel vm,
  }) => showModalBottomSheet(
    context: context,
    showDragHandle: true,
    builder: (context) => ChooseCategoryPage(vm: vm),
  );

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.sizeOf(context).width - 16;
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: vm.chosenCategory,
        builder:
            (context, category, _) => Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 32),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Flexible(
                    child: GridView.count(
                      semanticChildCount: vm.categories.length,
                      childAspectRatio: 32 / 8,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      crossAxisCount: 2,
                      children:
                          vm.categories
                              .map(
                                (e) => HabitCategoryWidget(
                                  vm: e,
                                  onTap: vm.chooseCategory,
                                  isChosen:
                                      e.title == vm.chosenCategory.value?.title,
                                ),
                              )
                              .toList(),
                    ),
                  ),
                  if (category != null) ...[
                    HabitTextButton(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      text: 'Выбрать категорию',
                      needBorder: true,
                    ),
                    const SizedBox(height: 4),
                  ],
                  // HabitTextButton(
                  //   onTap: () {},
                  //   text: 'Новая категорияы',
                  //   needBorder: true,
                  // ),
                ],
              ),
            ),
      ),
    );
  }
}
