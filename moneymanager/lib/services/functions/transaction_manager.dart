import 'package:moneyManager/services/models/transaction.dart';
import 'package:moneyManager/services/functions/transaction_category_manager.dart';
import 'package:moneyManager/services/functions/account_manager.dart';

class TransactionManager {
  static List<Transaction> trans = [
    Transaction(
        note: 'hehe',
        amount: 30,
        date: DateTime.now(),
        category: TransactionCategoryManager.incomeCategories[1],
        acc: AccountManager.accounts[1],
        type: Type.Income),
    Transaction(
        note: 'hehe1',
        amount: 30,
        date: DateTime.now(),
        category: TransactionCategoryManager.expenseCategories[1],
        acc: AccountManager.accounts[2],
        type: Type.Expense),
    Transaction(
        note: 'hehe',
        amount: 30,
        date: DateTime.now(),
        category: TransactionCategoryManager.incomeCategories[1],
        acc: AccountManager.accounts[1],
        type: Type.Income),
    Transaction(
        note: 'hehe1',
        amount: 30,
        date: DateTime.now(),
        category: TransactionCategoryManager.expenseCategories[1],
        acc: AccountManager.accounts[2],
        type: Type.Expense),
    Transaction(
        note: 'hehe',
        amount: 30,
        date: DateTime.now(),
        category: TransactionCategoryManager.incomeCategories[1],
        acc: AccountManager.accounts[1],
        type: Type.Income),
    Transaction(
        note: 'hehe1',
        amount: 30,
        date: DateTime.now(),
        category: TransactionCategoryManager.expenseCategories[1],
        acc: AccountManager.accounts[2],
        type: Type.Expense),
    Transaction(
        note: 'hehe',
        amount: 30,
        date: DateTime.now(),
        category: TransactionCategoryManager.incomeCategories[1],
        acc: AccountManager.accounts[1],
        type: Type.Income),
    Transaction(
        note: 'hehe1',
        amount: 30,
        date: DateTime.now(),
        category: TransactionCategoryManager.expenseCategories[1],
        acc: AccountManager.accounts[2],
        type: Type.Expense),
  ];
}
