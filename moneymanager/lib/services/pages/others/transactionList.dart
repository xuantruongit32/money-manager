import 'package:flutter/material.dart';
import 'package:moneyManager/services/pages/others/transactionItem.dart';
import 'package:moneyManager/services/models/trans.dart';

class TransactionList extends StatefulWidget {
  TransactionList(
      {required this.transList,
      required this.deleteTransaction,
      required this.editTransfer,
      Key? key})
      : super(key: key);
  final Function(Trans tran) deleteTransaction;
  final transList;
  final Function editTransfer;

  @override
  State<TransactionList> createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.transList.length,
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(widget.transList[index]),
        child: TransactionItem(
          editTransfer: widget.editTransfer,
          transaction: widget.transList[index],
        ),
        onDismissed: (direction) {
          widget.deleteTransaction(widget.transList[index]);
        },
      ),
    );
  }
}
