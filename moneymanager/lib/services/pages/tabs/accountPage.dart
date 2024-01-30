import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:moneyManager/services/functions/account_manager.dart';
import 'package:moneyManager/services/models/account.dart';
import 'package:moneyManager/services/pages/others/accountItem.dart';
import 'package:moneyManager/services/pages/others/newAccount.dart';
import 'package:moneyManager/services/pages/others/removeAccount.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  void addAcc(Account acc) {
    setState(() {
      AccountManager.accounts.add(acc);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton(
            onSelected: (value) {
              if (value == 'Add') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NewAccount(
                      addAcc: addAcc,
                    ),
                  ),
                );
              } else if (value == 'Remove') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RemoveAccount(),
                  ),
                );
              }
            },
            itemBuilder: (context) => <PopupMenuEntry<String>>[
              PopupMenuItem(child: Text('Add'), value: 'Add'),
              PopupMenuItem(child: Text('Remove'), value: 'Remove'),
              PopupMenuItem(child: Text('Edit'), value: 'Edit'),
            ],
          ),
        ],
        title: Text('Accounts'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.black,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text('Assets'),
                          Text(
                            AccountManager.getAssets().toStringAsFixed(2),
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text('Debt'),
                          Text(
                            AccountManager.getDebt().abs().toStringAsFixed(2),
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text('Total'),
                          Text(
                            AccountManager.getTotal().toStringAsFixed(2),
                            style: TextStyle(
                              fontSize: 20,
                              color: AccountManager.getTotal() >= 0
                                  ? Colors.blue
                                  : Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
            ),
            const Gap(50),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: AccountManager.accounts
                    .map((acc) => AccountItem(acc: acc))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}