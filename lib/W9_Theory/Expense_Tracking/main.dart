import 'Model/model.dart';

void main(){
  Expense firstFood = Expense('Burger', 20, DateTime.now(), ExpenseType.food);
  Expense firstShoe = Expense('Shoe', 50, DateTime.now(), ExpenseType.travel);

  print(firstFood.id);
  print(firstShoe.id);
}