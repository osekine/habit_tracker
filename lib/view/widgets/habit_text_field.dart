import 'package:flutter/material.dart';

class HabitTextField extends StatefulWidget {
  final TextEditingController controller;
  final String? hint;
  final FocusNode focusNode;
  const HabitTextField({
    super.key,
    required this.controller,
    required this.focusNode,
    this.hint,
  });

  @override
  State<HabitTextField> createState() => _HabitTextFieldState();
}

class _HabitTextFieldState extends State<HabitTextField> {
  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode;
  }

  @override
  Widget build(BuildContext context) {
    const shadowColor = Colors.black38;
    final labelText = widget.hint;

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
              border: Border.all(color: shadowColor),
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [
                BoxShadow(offset: Offset(0, 2), color: shadowColor),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 8, 16, 8),
              child: TextField(
                focusNode: _focusNode,
                onTapOutside: (event) => _focusNode.unfocus(),
                controller: widget.controller,
                decoration: const InputDecoration.collapsed(hintText: null),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
