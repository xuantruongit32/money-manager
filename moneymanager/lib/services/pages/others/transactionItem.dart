import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:moneyManager/services/functions/account_manager.dart';
import 'package:moneyManager/services/functions/transaction_category_manager.dart';
import 'package:moneyManager/services/models/trans.dart';
import 'package:moneyManager/services/pages/others/editTranferPage.dart';

class TransactionItem extends StatelessWidget {
  TransactionItem(
      {required this.transaction, required this.editTransfer, Key? key})
      : super(key: key);
  final Trans transaction;
  final format = DateFormat('d/M/yy');
  final Function editTransfer;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EditTransferPage(
                editTransfer: editTransfer, transfer: transaction),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(1),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Row(children: [
            Container(
              width: MediaQuery.of(context).size.width / 4,
              child: Column(
                children: [
                  Text(
                    format.format(transaction.date),
                  ),
                  Text(
                    TransactionCategoryManager.getCategoryFromId(
                            transaction.category)
                        .name,
                    style: TextStyle(color: Colors.black38),
                  ),
                ],
              ),
            ),
            const Gap(70),
            Column(
              children: [
                Text(
                  AccountManager.findAccById(transaction.accId).name,
                  style: TextStyle(color: Colors.black38),
                ),
                Text(transaction.note),
              ],
            ),
            const Spacer(),
            Text(
              transaction.amount.toString() + '\$',
              style: TextStyle(
                  color: (transaction.type == Type.Income)
                      ? Colors.blue
                      : (transaction.type == Type.Expense)
                          ? Colors.red
                          : Colors.black54),
            ),
          ]),
        ),
      ),
    );
  }
}
