import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:w4_app/W9_Theory/Expense_Tracking/Ui/expense_form.dart';
import '../Model/model.dart';

class ExpensesView extends StatelessWidget {
  final List<Expense> registeredExpenses;
  ExpensesView(this.registeredExpenses, {super.key});

  String formatDate(DateTime date) {
    return DateFormat.yMd().format(date);
  }

  IconData getCategoryIcon(ExpenseType type) {
    switch (type) {
      case ExpenseType.food:
        return Icons.fastfood;
      case ExpenseType.travel:
        return Icons.flight_takeoff;
      case ExpenseType.leisure:
        return Icons.movie;
      case ExpenseType.work:
        return Icons.work;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[100],

      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Ronan-The-Best Expenses App",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Center(
                    child: SizedBox(
                      height: 200,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ExpenseForm()
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            icon: const Icon(Icons.add, color: Colors.white),
          ),
        ],
      ),

      body: ListView.builder(
        itemCount: registeredExpenses.length,
        itemBuilder: (context, index) {
          final exp = registeredExpenses[index];

          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            elevation: 1.5,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  // LEFT: Title + Amount
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        exp.title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "\$${exp.amount.toStringAsFixed(2)}",
                        style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),

                  const Spacer(),

                  Row(
                    children: [
                      Icon(
                        getCategoryIcon(exp.category),
                        size: 22,
                        color: Colors.black54,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        formatDate(exp.date),
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
