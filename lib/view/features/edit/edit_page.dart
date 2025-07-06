import 'package:flutter/material.dart';
import 'package:habit_tracker/view/features/edit/color_table.dart';
import 'package:habit_tracker/view/widgets/habit_icon_button.dart';
import 'package:habit_tracker/view/widgets/habit_text_field.dart';
import 'package:habit_tracker/view_model/view_model.dart';

class EditPage extends StatefulWidget {
  final IEditPageViewModel vm;
  const EditPage({super.key, required this.vm});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  // TODO(NLU): delete Lorem Ipsum
  final _nameController = TextEditingController(text: 'Lorem');
  final _descController = TextEditingController(text: 'Ipsum');
  final _nameFocusNode = FocusNode();
  final _descFocusNode = FocusNode();
  late String colorName;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      leading: HabitIconButton(
        onTap: () async {
          await Navigator.of(context).pushReplacementNamed('/home');
        },
        icon: Icons.close,
      ),
      actions: [
        HabitIconButton(
          onTap: () async {
            if (_nameController.text.isEmpty) {
              _nameFocusNode.requestFocus();
              return;
            }
            widget.vm.saveHabit(
              _nameController.text,
              _descController.text,
              colorName,
            );
            await Navigator.of(context).pushReplacementNamed('/home');
          },
          icon: Icons.check,
        ),
      ],
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
              isNeccessary: true,
            ),
            HabitTextField(
              controller: _descController,
              hint: 'Description',
              focusNode: _descFocusNode,
            ),
            const SizedBox(height: 4),
            RepaintBoundary(
              child: ColorTable(onColorChangeCallback: _changeColor),
            ),
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

  // ignore: use_setters_to_change_properties
  void _changeColor(String newColorName) {
    colorName = newColorName;
  }
}
