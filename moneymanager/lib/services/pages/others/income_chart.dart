import 'package:flutter/material.dart';
import 'package:moneyManager/services/functions/transaction_category_manager.dart';
import 'package:moneyManager/services/functions/transaction_manager.dart';
import 'package:moneyManager/services/pages/others/inforStat.dart';
import 'package:moneyManager/services/pages/reusable/pie_chart.dart';

class IncomeChart extends StatelessWidget {
  IncomeChart({Key? key, required this.time, required this.date})
      : super(key: key);
  final DateTime date;
  final String time;
  double total = 0;

  @override
  Widget build(BuildContext context) {
    Map<String, double> dataMap = {
      for (String category in TransactionCategoryManager.incomeCategories)
        category: time == 'Monthly'
            ? TransactionManager().getIncomeMonthlyCategory(date, category)
            : time == 'Yearly'
                ? TransactionManager().getIncomeYearlyCategory(date, category)
                : TransactionManager().getIncomeWeeklyCategory(date, category),
    };

    dataMap.forEach((key, value) {
      total += value;
    });
    dataMap = {'total': total, ...dataMap};
    return Column(
      children: [
        InformationStat(dataMap: dataMap, colors: [
          Colors.red,
          Colors.green,
          Colors.blue,
          Colors.orange,
          Colors.purple,
          Colors.brown,
        ]),
        Chart(
          dataMap: dataMap,
          name: 'Test',
        ),
      ],
    );
  }
}
