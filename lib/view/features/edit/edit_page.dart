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
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

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
            HabitTextField(controller: _nameController, hint: 'Name'),
            HabitTextField(controller: _descController, hint: 'Description'),
            const SizedBox(height: 4),
            const ColorTable(),
          ],
        ),
      ),
    ),
  );
}
