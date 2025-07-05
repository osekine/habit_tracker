import 'package:flutter/material.dart';

class HabitTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? hint;
  const HabitTextField({super.key, required this.controller, this.hint});

  @override
  Widget build(BuildContext context) {
    final labelText = hint;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (labelText != null) ...[
            Text(labelText),
            const SizedBox(height: 4),
          ],
          DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [BoxShadow(offset: Offset(0, 5), blurRadius: 5)],
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 8, 16, 8),
              child: TextField(
                controller: controller,
                decoration: const InputDecoration.collapsed(hintText: null),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
