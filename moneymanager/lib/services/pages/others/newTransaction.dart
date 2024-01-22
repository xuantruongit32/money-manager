import 'package:flutter/material.dart';
import 'package:moneyManager/services/pages/reusable/lineOfAddTrans.dart';
import 'package:moneyManager/services/pages/reusable/addTextField.dart';
import 'package:line_icons/line_icons.dart';
import 'package:gap/gap.dart';
import 'package:moneyManager/services/pages/reusable/auth/authButton.dart';
import 'package:moneyManager/services/pages/reusable/choose.dart';
import 'package:intl/intl.dart';
import 'package:moneyManager/services/functions/account_manager.dart';
import 'package:moneyManager/services/models/account.dart';

class NewTransaction extends StatefulWidget {
  NewTransaction({Key? key}) : super(key: key);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  String selectedAccount =
      AccountManager.accounts.isNotEmpty ? "" : 'No accounts available';

  var format = DateFormat('d/M/yyyy (E)');
  var _selectedDate = DateTime.now();
  final _amountController = TextEditingController();
  final _noteController = TextEditingController();

  void _pickDate() async {
    final now = DateTime.now();
    final first = DateTime(now.year - 3, now.month, now.day);
    final last = DateTime(now.year + 2, now.month, now.day);
    final pickedDate = await showDatePicker(
        context: context, firstDate: first, lastDate: last, initialDate: now);
    setState(() {
      _selectedDate = pickedDate!;
    });
  }

  void _showAccountPicker(BuildContext context) async {
    final selected = await showDialog<Account>(
      context: context,
      builder: (BuildContext context) {
        return Choose(selected: selectedAccount, list: AccountManager.accounts);
      },
    );
    if (selected != null) {
      setState(() {
        selectedAccount = selected.name;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: _pickDate,
              child: LineOfAddTrans(
                text: 'Date       ',
                content: format.format(_selectedDate),
              ),
            ),
            const Gap(15),
            GestureDetector(
              onTap: () => _showAccountPicker(context),
              child: LineOfAddTrans(
                text: 'Account ',
                content: selectedAccount,
              ),
            ),
            const Gap(15),
            LineOfAddTrans(text: 'Category', content: 'Content'),
            const Gap(15),
            AddTextField(
                icon: Icon(LineIcons.coins),
                label: 'Amount',
                controller: _amountController,
                keyNumber: true),
            const Gap(15),
            AddTextField(
                icon: Icon(LineIcons.camera),
                label: 'Note',
                controller: _noteController,
                keyNumber: false),
            const Gap(30),
            AuthButton(buttonText: 'Save', fun: () {})
          ],
        ),
      ),
    );
  }
}
