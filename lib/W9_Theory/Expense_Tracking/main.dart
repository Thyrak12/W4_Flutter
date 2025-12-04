import 'package:flutter/material.dart';
import 'package:w4_app/W9_Theory/Expense_Tracking/Data/data.dart';
import 'package:w4_app/W9_Theory/Expense_Tracking/Ui/ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ExpensesView(registeredExpenses),
    );
  }
}
