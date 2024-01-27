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

  void getTransactionsDaily(DateTime daily) {
    Map<DateTime, List<Transaction>> groupedTransactions =
        groupTransactionsByDate();
    DateTime dateOnly = DateTime(daily.year, daily.month, daily.day);
    todayTrans = groupedTransactions[dateOnly] ?? [];
  }

  void getTransactionsWeekly(DateTime startDate) {
    Map<DateTime, List<Transaction>> groupedTransactions =
        groupTransactionsByDate();

    DateTime currentDate = startDate;
    DateTime endDate = startDate.add(Duration(days: 6));

    List<Transaction> weeklyTransactions = [];

    while (currentDate.isBefore(endDate) ||
        currentDate.isAtSameMomentAs(endDate)) {
      DateTime dateOnly =
          DateTime(currentDate.year, currentDate.month, currentDate.day);
      if (groupedTransactions.containsKey(dateOnly)) {
        weeklyTransactions.addAll(groupedTransactions[dateOnly]!);
      }

      currentDate = currentDate.add(Duration(days: 1));
    }

    weeklyTrans = weeklyTransactions;
  }

  void getTransactionsMonthly(DateTime startDate) {
    Map<DateTime, List<Transaction>> groupedTransactions =
        groupTransactionsByDate();

    int daysInMonth = DateTime(startDate.year, startDate.month + 1, 0).day;
    DateTime endDate = startDate.add(Duration(days: daysInMonth - 1));

    List<Transaction> monthlyTransactions = [];

    for (int i = startDate.day; i <= endDate.day; i++) {
      DateTime dateOnly = DateTime(startDate.year, startDate.month, i);
      if (groupedTransactions.containsKey(dateOnly)) {
        monthlyTransactions.addAll(groupedTransactions[dateOnly]!);
      }
    }
    monthlyTrans = monthlyTransactions;
  }

  void getTransactionsYearly(DateTime startDate) {
    Map<DateTime, List<Transaction>> groupedTransactions =
        groupTransactionsByDate();

    int currentYear = startDate.year;
    DateTime startDateOfYear = DateTime(currentYear, 1, 1);
    DateTime endDateOfYear = DateTime(currentYear, 12, 31);

    List<Transaction> yearlyTransactions = [];

    for (DateTime date = startDateOfYear;
        date.isBefore(endDateOfYear) || date.isAtSameMomentAs(endDateOfYear);
        date = date.add(Duration(days: 1))) {
      DateTime dateOnly = DateTime(date.year, date.month, date.day);
      if (groupedTransactions.containsKey(dateOnly)) {
        yearlyTransactions.addAll(groupedTransactions[dateOnly]!);
      }
    }

    yearlyTrans = yearlyTransactions;
  }

  static List<Transaction> todayTrans = [];
  static List<Transaction> weeklyTrans = [];
  static List<Transaction> monthlyTrans = [];
  static List<Transaction> yearlyTrans = [];
}