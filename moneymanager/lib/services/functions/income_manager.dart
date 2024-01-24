import 'package:moneyManager/services/models/income.dart';
import 'package:moneyManager/services/functions/account_manager.dart';
import 'package:moneyManager/services/functions/income_category_manager.dart';

class IncomeManager {
  static List<Income> incomes = [
    Income(
      acc: AccountManager.accounts[1],
      title: 'Hehe',
      amount: 20,
      category: IncomeCategoryManager.categories[1],
      date: DateTime.now(),
    ),
    Income(
      acc: AccountManager.accounts[1],
      title: 'Hehe',
      amount: 20,
      category: IncomeCategoryManager.categories[1],
      date: DateTime.now(),
    ),
    Income(
      acc: AccountManager.accounts[1],
      title: 'Hehe',
      amount: 20,
      category: IncomeCategoryManager.categories[1],
      date: DateTime.now(),
    ),
    Income(
      acc: AccountManager.accounts[1],
      title: 'Hehe',
      amount: 20,
      category: IncomeCategoryManager.categories[1],
      date: DateTime.now(),
    ),
  ];

  static addIncome(Income income) {
    incomes.add(income);
  }

  static removeIncome(Income income) {
    incomes.remove(income);
  }
}
