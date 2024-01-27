import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:moneyManager/services/models/transaction.dart';

class TransactionItem extends StatelessWidget {
  TransactionItem({required this.transaction, Key? key}) : super(key: key);
  final Transaction transaction;
  final format = DateFormat('d/M/yy');

  @override
  Widget build(BuildContext context) {
    return Card(
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
                  transaction.category,
                  style: TextStyle(color: Colors.black38),
                ),
              ],
            ),
          ),
          const Gap(70),
          Column(
            children: [
              Text(
                transaction.acc.name,
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
    );
  }
}
