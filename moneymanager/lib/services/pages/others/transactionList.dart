import 'package:flutter/material.dart';
import 'package:moneyManager/services/functions/transaction_manager.dart';
import 'package:moneyManager/services/pages/others/transactionItem.dart';
import 'package:moneyManager/services/models/transaction.dart';

class TransactionList extends StatefulWidget {
  TransactionList({required this.deleteTransaction, Key? key})
      : super(key: key);
  final Function(Transaction tran) deleteTransaction;

  @override
  State<TransactionList> createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: TransactionManager.trans.length,
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(TransactionManager.trans[index]),
        child: TransactionItem(
          transaction: TransactionManager.trans[index],
        ),
        onDismissed: (direction) {
          widget.deleteTransaction(TransactionManager.trans[index]);
        },
      ),
    );
  }
}
