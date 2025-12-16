import 'package:flutter/material.dart';

class AnswerOptionRow extends StatelessWidget {
  final String choice;
  final bool isCorrect;
  final bool isSelected;

  const AnswerOptionRow({
    super.key,
    required this.choice,
    required this.isCorrect,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    IconData iconData;
    Color color;

    if (isCorrect) {
      iconData = Icons.check_circle;
      color = Colors.green;
    } else if (isSelected) {
      iconData = Icons.cancel;
      color = Colors.red;
    } else {
      iconData = Icons.circle_outlined;
      color = Colors.grey;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Icon(iconData, color: color),
          const SizedBox(width: 8),
          Text(
            choice,
            style: TextStyle(
              fontSize: 16,
              color: color,
              fontWeight: isCorrect ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
