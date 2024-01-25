import 'package:flutter/material.dart';
import 'package:moneyManager/services/models/transaction.dart';
import 'package:moneyManager/services/functions/transaction_manager.dart';
import 'package:moneyManager/services/pages/others/newTransaction.dart';
import 'package:moneyManager/services/pages/others/transactionList.dart';

class Trans extends StatefulWidget {
  const Trans({Key? key}) : super(key: key);

  @override
  State<Trans> createState() => _TransState();
}

class _TransState extends State<Trans> {
  void _deleteTransaction(Transaction tran) {
    final transactionIndex = TransactionManager.trans.indexOf(tran);
    setState(() {
      TransactionManager.trans.remove(tran);
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Transaction Deleted'),
      action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              TransactionManager.trans.insert(transactionIndex, tran);
            });
          }),
    ));
  }

  void addTrans(Transaction tran) {
    setState(() {
      TransactionManager.trans.add(tran);
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
