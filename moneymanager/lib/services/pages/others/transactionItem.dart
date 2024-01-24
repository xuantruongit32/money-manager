import 'package:flutter/material.dart';
import 'package:moneyManager/services/models/expense.dart';
import 'package:moneyManager/services/models/income.dart';
import 'package:moneyManager/services/models/transfer.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({required this.transaction, Key? key})
      : super(key: key);
  final transaction;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(children: [
        Text(transaction.category),
        Expanded(
          child: Column(
            children: [
              Text(transaction.title),
              Text(transaction.acc.name),
            ],
          ),
        ),
        const Spacer(),
        Text(transaction.amount.toString()),
      ]),
    );
  }
}
