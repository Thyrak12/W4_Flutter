import 'package:uuid/uuid.dart';
import '../Model/model.dart';

var uuid = Uuid();

final List<Expense> registeredExpenses = [
  Expense(
    "Breakfast - Coffee & Sandwich",
    4.50,
    DateTime(2025, 1, 12),
    ExpenseType.food,
  ),
  Expense(
    "Tuk Tuk to School",
    2.00,
    DateTime(2025, 1, 13),
    ExpenseType.travel,
  ),
  Expense(
    "Cinema Ticket",
    5.00,
    DateTime(2025, 1, 10),
    ExpenseType.leisure,
  ),
  Expense(
    "Laptop Mouse",
    12.99,
    DateTime(2025, 1, 9),
    ExpenseType.work,
  ),
  Expense(
    "Lunch – Fried Rice",
    3.00,
    DateTime(2025, 1, 11),
    ExpenseType.food,
  ),
];
