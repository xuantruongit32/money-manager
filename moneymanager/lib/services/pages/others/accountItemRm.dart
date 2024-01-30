import 'package:flutter/material.dart';

class AccountItemRm extends StatelessWidget {
  const AccountItemRm(
      {Key? key, required this.account, required this.removeAcc})
      : super(key: key);

  final Function removeAcc;

  final account;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(account.name),
          IconButton(
            onPressed: () => removeAcc(account),
            icon: Icon(
              Icons.remove_circle,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
