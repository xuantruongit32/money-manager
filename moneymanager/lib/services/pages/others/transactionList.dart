import 'package:flutter/material.dart';
import 'package:moneyManager/services/functions/income_manager.dart';
import 'package:moneyManager/services/pages/others/transactionItem.dart';
import 'package:moneyManager/services/models/income.dart';

class TransactionList extends StatefulWidget {
  TransactionList({required this.deleteTransaction, Key? key})
      : super(key: key);
  final Function(Income income) deleteTransaction;

  @override
  State<TransactionList> createState() => _TransactionListState();
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
        onDismissed: (direction) {
          widget.deleteTransaction(IncomeManager.incomes[index]);
        },
      ),
    );
  }
}
