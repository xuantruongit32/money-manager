import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:moneyManager/services/functions/account_manager.dart';
import 'package:moneyManager/services/pages/others/accoutItem.dart';

class Account extends StatelessWidget {
  const Account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.edit),
          ),
        ],
        title: Text('Accounts'),
      ),
      body: Column(
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
    );
  }
}
