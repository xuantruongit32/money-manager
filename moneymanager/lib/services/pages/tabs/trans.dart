import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:moneyManager/services/models/transaction.dart';
import 'package:moneyManager/services/pages/others/newTransaction.dart';
import 'package:moneyManager/services/pages/others/transactionList.dart';
import 'package:moneyManager/services/functions/transaction_manager.dart';

class Trans extends StatefulWidget {
  Trans({Key? key}) : super(key: key);

  @override
  State<Trans> createState() => _TransState();
}

class _TransState extends State<Trans> {
  var _selectedDate = DateTime.now();
  @override
  void initState() {
    TransactionManager().getTransactionsDaily(_selectedDate);
    super.initState();
  }

  void _deleteTransaction(Transaction tran) {
    final transactionIndex = TransactionManager.trans.indexOf(tran);
    final todayTransactionIndex = TransactionManager.todayTrans.indexOf(tran);
    setState(() {
      TransactionManager.trans.remove(tran);
      TransactionManager.todayTrans.remove(tran);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Transaction Deleted'),
        action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              setState(() {
                TransactionManager.trans.insert(transactionIndex, tran);
                TransactionManager.todayTrans
                    .insert(todayTransactionIndex, tran);
              });
            }),
      ),
    );
  }

  void addTrans(Transaction tran) {
    setState(() {
      TransactionManager.trans.add(tran);
      TransactionManager().getTransactionsDaily(_selectedDate);
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    var format = DateFormat('d/M/yyyy (E)');
    void _pickDate() async {
      final now = DateTime.now();
      final first = DateTime(now.year - 3, now.month, now.day);
      final last = DateTime(now.year + 2, now.month, now.day);
      final pickedDate = await showDatePicker(
          context: context, firstDate: first, lastDate: last, initialDate: now);
      setState(() {
        _selectedDate = pickedDate!;
        TransactionManager().getTransactionsDaily(_selectedDate);
      });
    }

    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () => _pickDate(),
            child: Text(
              format.format(_selectedDate),
            ),
          ),
        ],
      ),
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
      body: TransactionManager.todayTrans.length == 0
          ? Center(child: Text('No transaction found'))
          : TransactionList(
              transList: TransactionManager.todayTrans,
              deleteTransaction: _deleteTransaction,
            ),
    );
  }
}
