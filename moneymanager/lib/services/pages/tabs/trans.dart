import 'package:flutter/material.dart';
import 'package:moneyManager/services/models/income.dart';
import 'package:moneyManager/services/functions/income_manager.dart';
import 'package:moneyManager/services/pages/others/newTransaction.dart';
import 'package:moneyManager/services/pages/others/transactionList.dart';

class Trans extends StatefulWidget {
  const Trans({Key? key}) : super(key: key);

  @override
  State<Trans> createState() => _TransState();
}

class _TransState extends State<Trans> {
  void _deleteTransaction(Income income) {
    final transactionIndex = IncomeManager.incomes.indexOf(income);
    setState(() {
      IncomeManager.removeIncome(income);
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Transaction Deleted'),
      action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              IncomeManager.incomes.insert(transactionIndex, income);
            });
          }),
    ));
  }

  void addTrans(Income income) {
    setState(() {
      IncomeManager.incomes.add(income);
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => NewTransaction(
                        addTrans: addTrans,
                      )));
        },
        child: Icon(Icons.add),
      ),
      body: TransactionList(
        deleteTransaction: _deleteTransaction,
      ),
    );
  }
}
