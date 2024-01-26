import 'package:moneyManager/services/models/transaction.dart';
import 'package:moneyManager/services/functions/transaction_category_manager.dart';
import 'package:moneyManager/services/functions/account_manager.dart';

class TransactionManager {
  static List<Transaction> trans = [
    Transaction(
        note: 'hehe1',
        amount: 30,
        date: DateTime.now(),
        category: TransactionCategoryManager.expenseCategories[1],
        acc: AccountManager.accounts[2],
        type: Type.Expense),
    Transaction(
        note: 'hehe2',
        amount: 30,
        date: DateTime(
            DateTime.now().year - 1, DateTime.now().month, DateTime.now().day),
        category: TransactionCategoryManager.expenseCategories[1],
        acc: AccountManager.accounts[2],
        type: Type.Expense),
  ];
  Map<DateTime, List<Transaction>> groupTransactionsByDate() {
    Map<DateTime, List<Transaction>> groupedTransactions = {};

    for (Transaction transaction in trans) {
      DateTime dateOnly = DateTime(
          transaction.date.year, transaction.date.month, transaction.date.day);

      if (!groupedTransactions.containsKey(dateOnly)) {
        groupedTransactions[dateOnly] = [];
      }

      groupedTransactions[dateOnly]!.add(transaction);
    }

    return groupedTransactions;
  }

  void getTransactionsForToday() {
    Map<DateTime, List<Transaction>> groupedTransactions =
        groupTransactionsByDate();
    DateTime today = DateTime.now();
    DateTime todayDateOnly = DateTime(today.year, today.month, today.day);
    todayTrans = groupedTransactions[todayDateOnly] ?? [];

  }

  static List<Transaction> todayTrans = [];
}
