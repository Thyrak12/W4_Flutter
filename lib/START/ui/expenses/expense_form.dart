import 'package:flutter/material.dart';
import '../../models/expense.dart';

class ExpenseForm extends StatefulWidget {
  const ExpenseForm({super.key});

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  Category selectedCategory = Category.food;

  @override
  void dispose() {
    super.dispose();

    _titleController.dispose();
    _amountController.dispose();
  }

  void onCreate() {
    //  1 Build an expense
    String title = _titleController.text;
    double amount = double.tryParse(_amountController.text)!;
    Category category = selectedCategory; // for now..
    DateTime date = DateTime.now();

    Expense newExpense = Expense(
      title: title,
      amount: amount,
      date: date,
      category: category,
    );
    // 2 Close the modal
    Navigator.pop(context, newExpense);
  }

  void onCancel() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _titleController,
            decoration: InputDecoration(label: Text("Title")),
            maxLength: 50,
          ),
          TextField(
            controller: _amountController,
            decoration: InputDecoration(label: Text("Amount")),
            maxLength: 50,
          ),
          DropdownButton(
            value: selectedCategory,
            items: Category.values.map((e)=>{
              DropdownMenuItem(value: e, child: Text(e.name.toUpperCase()),)
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedCategory = value!;
              });
            },
          ),
          ElevatedButton(onPressed: onCancel, child: Text("Cancel")),
          SizedBox(width: 10),
          ElevatedButton(onPressed: onCreate, child: Text("Create")),
        ],
      ),
    );
  }
}
