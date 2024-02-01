import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:moneyManager/network/fire_store.dart';
import 'package:moneyManager/services/functions/account_manager.dart';
import 'package:moneyManager/services/models/trans.dart';
import 'package:moneyManager/services/pages/others/newTransaction.dart';
import 'package:moneyManager/services/pages/others/transactionList.dart';
import 'package:moneyManager/services/functions/transaction_manager.dart';

class TransPage extends StatefulWidget {
  TransPage({Key? key}) : super(key: key);

  @override
  State<TransPage> createState() => _TransPageState();
}

class _TransPageState extends State<TransPage> {
  var _selectedPage = 0;
  final _controller = PageController(initialPage: 0);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onPageChange(int page) {
    setState(() {
      _selectedPage = page;
    });
  }

  var _selectedDate = DateTime.now();

  @override
  void initState() {
    var userId = FireStore().getUserId();
    FireStore().fetchTransactionsFromFireStore(userId).then((value) {
      TransactionManager().getTransactionsDaily(_selectedDate);
      TransactionManager().getTransactionsMonthly(_selectedDate);
      TransactionManager().getTransactionsYearly(_selectedDate);
      setState(() {});
    });
    super.initState();
  }

  void _deleteTransaction(Trans tran) {
    final transactionIndex = TransactionManager.trans.indexOf(tran);
    final todayTransactionIndex = TransactionManager.todayTrans.indexOf(tran);
    final monthTransactionIndex = TransactionManager.monthlyTrans.indexOf(tran);
    final yearlyTransactionIndex = TransactionManager.yearlyTrans.indexOf(tran);
    setState(() {
      if (tran.type == Type.Income) {
        AccountManager.findAccById(tran.id).amount -= tran.amount;
      } else if (tran.type == Type.Expense) {
        AccountManager.findAccById(tran.id).amount;
      } else {
        AccountManager.findAccById(tran.accId).amount += tran.amount;
        AccountManager.findAccById(tran.accId).amount -= tran.amount;
      }
      TransactionManager.trans.remove(tran);
      FireStore().removeTransactionToFireStore(tran);
      if (tran.date.day == _selectedDate.day &&
          tran.date.month == _selectedDate.month &&
          tran.date.year == _selectedDate.year) {
        TransactionManager.todayTrans.remove(tran);
      } else if (tran.date.month == _selectedDate.month &&
          tran.date.year == _selectedDate.year) {
        TransactionManager.monthlyTrans.remove(tran);
      } else if (tran.date.year == _selectedDate.year) {
        TransactionManager.yearlyTrans.remove(tran);
      }
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 2),
        content: Text('Transaction Deleted'),
        action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              setState(() {
                if (tran.type == Type.Income) {
                  AccountManager.findAccById(tran.id).amount += tran.amount;
                } else if (tran.type == Type.Expense) {
                  AccountManager.findAccById(tran.id).amount -= tran.amount;
                } else {
                  AccountManager.findAccById(tran.accId).amount -= tran.amount;
                  AccountManager.findAccById(tran.accId).amount += tran.amount;
                }
                FireStore().addTransactionToFireStore(tran);
                TransactionManager.trans.insert(transactionIndex, tran);
                if (tran.date.day == _selectedDate.day &&
                    tran.date.month == _selectedDate.month &&
                    tran.date.year == _selectedDate.year) {
                  TransactionManager.todayTrans
                      .insert(todayTransactionIndex, tran);
                } else if (tran.date.month == _selectedDate.month &&
                    tran.date.year == _selectedDate.year) {
                  TransactionManager.monthlyTrans
                      .insert(monthTransactionIndex, tran);
                } else if (tran.date.year == _selectedDate.year) {
                  TransactionManager.yearlyTrans
                      .insert(yearlyTransactionIndex, tran);
                }
              });
            }),
      ),
    );
  }

  void addTrans(Trans tran) {
    setState(() {
      if (tran.type == Type.Income) {
        AccountManager.findAccById(tran.accId).amount += tran.amount;
      } else if (tran.type == Type.Expense) {
        AccountManager.findAccById(tran.accId).amount -= tran.amount;
      } else {
        AccountManager.findAccById(tran.accId).amount -= tran.amount;
        AccountManager.findAccById(tran.accId).amount += tran.amount;
      }
      TransactionManager.trans.add(tran);
      FireStore().addTransactionToFireStore(tran);
      TransactionManager().getTransactionsDaily(_selectedDate);
      TransactionManager().getTransactionsMonthly(_selectedDate);
      TransactionManager().getTransactionsYearly(_selectedDate);
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    var format = DateFormat('d/M/yyyy');
    void _pickDate() async {
      final now = DateTime.now();
      final first = DateTime(now.year - 3, now.month, now.day);
      final last = DateTime(now.year + 2, now.month, now.day);
      final pickedDate = await showDatePicker(
          context: context, firstDate: first, lastDate: last, initialDate: now);
      setState(() {
        _selectedDate = pickedDate!;
        TransactionManager().getTransactionsDaily(_selectedDate);
        TransactionManager().getTransactionsMonthly(_selectedDate);
        TransactionManager().getTransactionsYearly(_selectedDate);
      });
    }

    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 18.0),
            child: TextButton(
              onPressed: () => _pickDate(),
              child: Text(
                format.format(_selectedDate),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              _controller.animateToPage(
                0,
                duration: Duration(
                  milliseconds: 500,
                ),
                curve: Curves.easeInOut,
              );
            },
            child: Text(
              'Daily',
              style: TextStyle(
                color: _selectedPage == 0 ? Colors.black : Colors.deepPurple,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              _controller.animateToPage(
                1,
                duration: Duration(
                  milliseconds: 500,
                ),
                curve: Curves.easeInOut,
              );
            },
            child: Text(
              'Monthly',
              style: TextStyle(
                color: _selectedPage == 1 ? Colors.black : Colors.deepPurple,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              _controller.animateToPage(
                2,
                duration: Duration(
                  milliseconds: 500,
                ),
                curve: Curves.easeInOut,
              );
            },
            child: Text(
              'Yearly',
              style: TextStyle(
                color: _selectedPage == 2 ? Colors.black : Colors.deepPurple,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              _controller.animateToPage(
                3,
                duration: Duration(
                  milliseconds: 500,
                ),
                curve: Curves.easeInOut,
              );
            },
            child: Text(
              'Total',
              style: TextStyle(
                color: _selectedPage == 3 ? Colors.black : Colors.deepPurple,
              ),
            ),
          )
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
      body: PageView(
        onPageChanged: _onPageChange,
        controller: _controller,
        scrollDirection: Axis.horizontal,
        children: [
          TransactionManager.todayTrans.length == 0
              ? Center(child: Text('No transaction found'))
              : TransactionList(
                  transList: TransactionManager.todayTrans,
                  deleteTransaction: _deleteTransaction,
                ),
          TransactionManager.monthlyTrans.length == 0
              ? Center(child: Text('No transaction found'))
              : TransactionList(
                  transList: TransactionManager.monthlyTrans,
                  deleteTransaction: _deleteTransaction,
                ),
          TransactionManager.yearlyTrans.length == 0
              ? Center(child: Text('No transaction found'))
              : TransactionList(
                  transList: TransactionManager.yearlyTrans,
                  deleteTransaction: _deleteTransaction,
                ),
          TransactionManager.trans.length == 0
              ? Center(child: Text('No transaction found'))
              : TransactionList(
                  transList: TransactionManager.trans,
                  deleteTransaction: _deleteTransaction,
                ),
        ],
      ),
    );
  }
}
