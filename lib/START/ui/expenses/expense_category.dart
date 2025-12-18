import 'package:flutter/material.dart';
import '../../models/expense.dart';

class ExpenseCategory extends StatelessWidget {
  final List<Expense> expenses;

  const ExpenseCategory({super.key, required this.expenses});

  // Calculate total amount for a category
  double totalPrice(Category category) {
    double sum = 0;
    for (final expense in expenses) {
      if (expense.category == category) {
        sum += expense.amount;
      }
    }
    return sum;
  }

  // Icon for each category
  IconData categoryIcon(Category category) {
    switch (category) {
      case Category.food:
        return Icons.free_breakfast;
      case Category.travel:
        return Icons.travel_explore;
      case Category.leisure:
        return Icons.holiday_village;
      case Category.work:
        return Icons.work;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: Category.values.map((category) {
          return CategoryItem(
            categoryIcon: categoryIcon(category),
            totalPrice: totalPrice(category),
          );
        }).toList(),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final IconData categoryIcon;
  final double totalPrice;

  const CategoryItem({
    super.key,
    required this.categoryIcon,
    required this.totalPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(categoryIcon, size: 30),
        const SizedBox(height: 4),
        Text('$totalPrice'),
      ],
    );
  }
}
