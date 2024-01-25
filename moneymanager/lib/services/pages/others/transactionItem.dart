import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:moneyManager/services/models/transaction.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({required this.transaction, Key? key})
      : super(key: key);
  final Transaction transaction;

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
            child: Text(
              transaction.category,
              style: TextStyle(color: Colors.black38),
            ),
          ),
          const Gap(50),
          Column(
            children: [
              Text(transaction.note),
              Text(
                transaction.acc.name,
                style: TextStyle(color: Colors.black38),
              ),
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
