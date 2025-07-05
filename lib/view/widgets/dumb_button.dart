import 'package:flutter/material.dart';

class DumbButton extends StatelessWidget {
  const DumbButton({super.key});

  @override
  Widget build(BuildContext context) => Container(
    height: 36,
    width: 36,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: Colors.blueGrey,
    ),
    child: const Center(child: Icon(Icons.star)),
  );
}
