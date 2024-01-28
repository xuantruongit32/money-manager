import 'package:flutter/material.dart';
import 'package:moneyManager/services/functions/transaction_category_manager.dart';
import 'package:moneyManager/services/pages/reusable/pie_chart.dart';

class IncomeChart extends StatelessWidget {
  const IncomeChart({Key? key, required this.fun}) : super(key: key);

  final Function(String category) fun;

  @override
  Widget build(BuildContext context) {
    Map<String, double> dataMap = {
      for (String category in TransactionCategoryManager.incomeCategories)
        category: fun(category)
    };
    return Chart(
      dataMap: dataMap,
      name: 'Test',
    );
  }
}
