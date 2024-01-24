import 'package:flutter/material.dart';
import 'package:moneyManager/services/functions/income_manager.dart';
import 'package:moneyManager/services/pages/others/transactionItem.dart';

class TransactionList extends StatefulWidget {
  TransactionList({Key? key}) : super(key: key);

  @override
  _TransactionListState createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: IncomeManager.incomes.length,
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(IncomeManager.incomes[index]),
        child: TransactionItem(
          transaction: IncomeManager.incomes[index],
        ),
        onDismissed: (direction) => {},
      ),
    );
  }
}
