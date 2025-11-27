import 'package:uuid/uuid.dart';
var uuid = Uuid();

enum ExpenseType{food, travel, leisure, work}

class Expense{
  String id = uuid.v4();
  String title;
  double amount;
  DateTime date;
  ExpenseType category;

  Expense(this.title, this.amount, this.date, this.category);
}