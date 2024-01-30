import 'package:flutter/material.dart';
import 'package:moneyManager/services/functions/account_manager.dart';
import 'package:moneyManager/services/pages/others/accoutItem.dart';

class Account extends StatelessWidget {
  const Account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.edit),
        ),
      ]),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: AccountManager.accounts
              .map((acc) => AccountItem(acc: acc))
              .toList(),
        ),
      ),
    );
  }
}
