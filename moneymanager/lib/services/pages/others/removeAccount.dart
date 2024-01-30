import 'package:flutter/material.dart';
import 'package:moneyManager/services/functions/account_manager.dart';
import 'package:moneyManager/services/pages/others/accountItemRm.dart';

class RemoveAccount extends StatefulWidget {
  RemoveAccount({Key? key}) : super(key: key);

  @override
  _RemoveAccountState createState() => _RemoveAccountState();
}

class _RemoveAccountState extends State<RemoveAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Remove Account'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 1),
          child: Column(
            children: AccountManager.accounts
                .map(
                  (e) => AccountItemRm(account: e),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
