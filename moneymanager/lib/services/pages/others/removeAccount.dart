import 'package:flutter/material.dart';
import 'package:moneyManager/services/functions/account_manager.dart';
import 'package:moneyManager/services/pages/others/accountItemRm.dart';

class RemoveAccount extends StatefulWidget {
  RemoveAccount({Key? key, required this.removeAcc}) : super(key: key);
  final Function removeAcc;

  @override
  _RemoveAccountState createState() => _RemoveAccountState();
}

class _RemoveAccountState extends State<RemoveAccount> {
  void removeAccount(var acc) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Center(child: Text('Confirm Remove')),
        content: Text('Are you sure want to remove account?'),
        actions: [
          ElevatedButton(
            onPressed: () => setState(() {
              widget.removeAcc(acc);
              Navigator.pop(context);
            }),
            child: Text('OK'),
          ),
          ElevatedButton(
            onPressed: () => setState(() {
              Navigator.pop(context);
            }),
            child: Text('Cancel'),
          ),
        ],
      ),
    );
  }

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
                  (e) => AccountItemRm(
                    account: e,
                    removeAcc: removeAccount,
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
