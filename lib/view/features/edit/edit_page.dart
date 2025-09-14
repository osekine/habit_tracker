import 'package:flutter/material.dart';
import 'package:habit_tracker/navigation/router.dart';
import 'package:habit_tracker/theme/habit_colors.dart';
import 'package:habit_tracker/view/features/categories/choose_category_page.dart';
import 'package:habit_tracker/view/features/edit/color_table.dart';
import 'package:habit_tracker/view/features/edit/edit_page_header.dart';
import 'package:habit_tracker/view/widgets/habit_text_button.dart';
import 'package:habit_tracker/view/widgets/habit_text_field.dart';
import 'package:habit_tracker/view_model/view_model.dart';

class EditPage extends StatefulWidget {
  final IEditPageViewModel vm;
  const EditPage({super.key, required this.vm});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final _nameController = TextEditingController();
  final _descController = TextEditingController();
  final _nameFocusNode = FocusNode();
  final _descFocusNode = FocusNode();
  late String colorName;

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: ColorCollection.monocrome['white']!.baseColor.withAlpha(
      255,
    ),
    body: CustomScrollView(
      slivers: [
        SliverPersistentHeader(
          pinned: true,
          delegate: EditPageHeader(
            minExtent: 50,
            maxExtent: 70,
            vm: widget.vm,
            onApplyTap: () {
              if (_nameController.text.isEmpty) {
                _nameFocusNode.requestFocus();
                return;
              }
              widget.vm.saveHabit(
                _nameController.text,
                _descController.text,
                colorName,
              );
              HomeRoute().go(context);
            },
            onCrossTap: () {
              HomeRoute().go(context);
            },
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    width: double.infinity,
                    height: 250,
                    child: ColoredBox(
                      color: Colors.black45,
                      child: Center(child: Text('Choose your icon')),
                    ),
                  ),
                  HabitTextField(
                    controller: _nameController,
                    hint: 'Name',
                    focusNode: _nameFocusNode,
                    isNeccessary: true,
                  ),
                  HabitTextField(
                    controller: _descController,
                    hint: 'Description',
                    focusNode: _descFocusNode,
                  ),
                  const SizedBox(height: 4),
                  HabitTextButton(
                    text: 'Category',
                    needBorder: true,
                    onTap:
                        () async => ChooseCategoryPage.showAsModalBottomSheet(
                          context,
                          categories: widget.vm.categories,
                        ),
                  ),
                  const SizedBox(height: 8),
                  RepaintBoundary(
                    child: ColorTable(onColorChangeCallback: _changeColor),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ],
    ),
  );

  @override
  void dispose() {
    _nameController.dispose();
    _nameFocusNode.dispose();
    _descController.dispose();
    _descFocusNode.dispose();
    super.dispose();
  }

  // ignore: use_setters_to_change_properties
  void _changeColor(String newColorName) {
    colorName = newColorName;
  }
}
