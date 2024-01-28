import 'package:flutter/material.dart';
import 'package:moneyManager/services/functions/transaction_category_manager.dart';
import 'package:moneyManager/services/functions/transaction_manager.dart';
import 'package:moneyManager/services/pages/reusable/pie_chart.dart';

class ExpenseChart extends StatelessWidget {
  const ExpenseChart({Key? key, required this.time, required this.date})
      : super(key: key);
  final DateTime date;
  final String time;

  @override
  Widget build(BuildContext context) {
    Map<String, double> dataMap = {
      for (String category in TransactionCategoryManager.expenseCategories)
        category: time == 'Monthly'
            ? TransactionManager().getExpenseMonthlyCategory(date, category)
            : time == 'Yearly'
                ? TransactionManager().getExpenseYearlyCategory(date, category)
                : TransactionManager().getExpenseWeeklyCategory(date, category),
    };
    return Chart(
      dataMap: dataMap,
      name: 'Test',
    );
  }
}
