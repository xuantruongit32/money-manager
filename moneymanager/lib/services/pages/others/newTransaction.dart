import 'package:flutter/material.dart';
import 'package:moneyManager/services/pages/others/newExpense.dart';
import 'package:moneyManager/services/pages/others/newIncome.dart';
import 'package:gap/gap.dart';

class NewTransaction extends StatefulWidget {
  NewTransaction({Key? key}) : super(key: key);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _controller = PageController(initialPage: 0);
  int _selectedPage = 0;
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              _controller.animateToPage(
                0,
                duration: const Duration(seconds: 1),
                curve: Curves.easeInOut,
              );
              setState(() {
                _selectedPage = 0;
              });
            },
            child: Text(
              'Income',
              style: TextStyle(
                color: _selectedPage == 0 ? Colors.deepPurple : Colors.black,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              _controller.animateToPage(
                1,
                duration: const Duration(seconds: 1),
                curve: Curves.easeInOut,
              );
              setState(() {
                _selectedPage = 1;
              });
            },
            child: Text(
              'Expense',
              style: TextStyle(
                color: _selectedPage == 1 ? Colors.deepPurple : Colors.black,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                _selectedPage = 2;
              });
            },
            child: Text(
              'Transfer',
              style: TextStyle(
                color: _selectedPage == 2 ? Colors.deepPurple : Colors.black,
              ),
            ),
          ),
          const Gap(50),
        ],
      ),
      body: PageView(
        controller: _controller,
        scrollDirection: Axis.horizontal,
        children: [
          NewIncome(),
          NewExpense(),
        ],
      ),
    );
  }
}
