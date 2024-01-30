import 'package:flutter/material.dart';
import 'package:moneyManager/services/functions/transaction_category_manager.dart';
import 'package:moneyManager/services/functions/transaction_manager.dart';
import 'package:moneyManager/services/pages/others/inforStat.dart';
import 'package:moneyManager/services/pages/reusable/pie_chart.dart';

class ExpenseChart extends StatelessWidget {
  ExpenseChart({Key? key, required this.time, required this.date})
      : super(key: key);
  final DateTime date;
  final String time;

  @override
  Widget build(BuildContext context) {
  double total = 0;
    Map<String, double> dataMap = {
      for (String category in TransactionCategoryManager.expenseCategories)
        category: time == 'Monthly'
            ? TransactionManager().getExpenseMonthlyCategory(date, category)
            : time == 'Yearly'
                ? TransactionManager().getExpenseYearlyCategory(date, category)
                : TransactionManager().getExpenseWeeklyCategory(date, category),
    };
    dataMap.forEach((key, value) {
      total += value;
    });
    dataMap = {'total': total, ...dataMap};
    return Column(
      children: [
        InformationStat(
          dataMap: dataMap,
          colors: [
            Colors.red,
            Colors.green,
            Colors.blue,
            Colors.orange,
            Colors.purple,
            Colors.brown,
          ],
        ),
        Chart(
          dataMap: dataMap,
          name: 'Test',
        ),
      ],
    );
  }
}
