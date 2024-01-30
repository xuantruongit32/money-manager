import 'package:flutter/material.dart';
import 'package:moneyManager/services/models/account.dart';

class AccountItem extends StatelessWidget {
  const AccountItem({
    Key? key,
    required this.acc,
  }) : super(key: key);

  final Account acc;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Text(acc.name),
          Text(
            acc.amount.toString() + '\$',
            style: TextStyle(
              color: Colors.blue,
            ),
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      ),
    );
  }
}
