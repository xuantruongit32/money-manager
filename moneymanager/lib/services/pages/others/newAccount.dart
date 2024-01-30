import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:moneyManager/services/pages/reusable/addTextField.dart';
import 'package:moneyManager/services/pages/reusable/auth/authButton.dart';

class NewAccount extends StatefulWidget {
  NewAccount({Key? key}) : super(key: key);

  @override
  _NewAccountState createState() => _NewAccountState();
}

class _NewAccountState extends State<NewAccount> {
  final _nameController = TextEditingController();
  final _amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Account'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Column(
          children: [
            AddTextField(
              label: 'Name',
              controller: _nameController,
              keyNumber: false,
              icon: Icon(Icons.account_balance_wallet),
            ),
            AddTextField(
              label: 'Amount',
              controller: _amountController,
              keyNumber: true,
              icon: Icon(Icons.money),
            ),
            const Gap(50),
            AuthButton(buttonText: 'Save', fun: () {}),
          ],
        ),
      ),
    );
  }
}
