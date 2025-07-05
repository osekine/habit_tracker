import 'package:flutter/material.dart';
import 'package:habit_tracker/view/features/edit/color_table.dart';
import 'package:habit_tracker/view/widgets/habit_icon_button.dart';
import 'package:habit_tracker/view/widgets/habit_text_field.dart';

class EditPage extends StatefulWidget {
  const EditPage({super.key});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final _nameController = TextEditingController();
  final _descController = TextEditingController();
  final _nameFocusNode = FocusNode();
  final _descFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      leading: HabitIconButton(onTap: () {}, icon: Icons.close),
      actions: [HabitIconButton(onTap: () {}, icon: Icons.check)],
    ),
    body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
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
            ),
            HabitTextField(
              controller: _descController,
              hint: 'Description',
              focusNode: _descFocusNode,
            ),
            const SizedBox(height: 4),
            const RepaintBoundary(child: ColorTable()),
          ],
        ),
      ),
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
}
