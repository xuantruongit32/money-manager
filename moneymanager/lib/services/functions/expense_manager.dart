import 'package:moneymanager/services/models/expense.dart';

class ExpenseManager {
  static List<Expense> expenses=[];

  static addIncome(Expense expense){
    expenses.add(expense);
  }
  static removeIncome(Expense expense){
    expenses.remove(expense);
  }
}
