import 'package:flutter/material.dart';

class ChoiceButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const ChoiceButton({
    super.key,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: ElevatedButton(
        onPressed: onTap,
        child: Text(label),
      ),
    );
  }
}
