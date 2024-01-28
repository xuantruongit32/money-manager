import 'package:flutter/material.dart';
import 'package:moneyManager/services/functions/transaction_manager.dart';
import 'package:moneyManager/services/pages/others/expense_chart.dart';
import 'package:moneyManager/services/pages/others/income_chart.dart';

class Stats extends StatefulWidget {
  const Stats({Key? key}) : super(key: key);

  @override
  State<Stats> createState() => _StatsState();
}

class _StatsState extends State<Stats> {
  final _controller = PageController();
  var _selectedPage = 0;
  void _onPageChanged(int page) {
    setState(() {
      _selectedPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'Income',
              style: TextStyle(
                color: _selectedPage == 0 ? Colors.black : Colors.deepPurple,
              ),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'Expense',
              style: TextStyle(
                color: _selectedPage == 1 ? Colors.black : Colors.deepPurple,
              ),
            ),
          ),
        ],
      ),
      body: PageView(
        scrollDirection: Axis.horizontal,
        controller: _controller,
        onPageChanged: _onPageChanged,
        children: [
          IncomeChart(fun: TransactionManager().getIncomeMonthlyCategory),
          ExpenseChart(fun: TransactionManager().getExpenseMonthlyCategory),
        ],
      ),
    );
  }
}
