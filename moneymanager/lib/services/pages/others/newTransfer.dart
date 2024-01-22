import 'package:flutter/material.dart';
import 'package:moneyManager/services/pages/reusable/lineOfAddTrans.dart';
import 'package:moneyManager/services/pages/reusable/addTextField.dart';
import 'package:line_icons/line_icons.dart';
import 'package:gap/gap.dart';
import 'package:moneyManager/services/pages/reusable/auth/authButton.dart';
import 'package:intl/intl.dart';
import 'package:moneyManager/services/functions/account_manager.dart';
import 'package:moneyManager/services/models/account.dart';

class NewTransfer extends StatefulWidget {
  NewTransfer({Key? key}) : super(key: key);

  @override
  _NewTransferState createState() => _NewTransferState();
}

class _NewTransferState extends State<NewTransfer> {
  String selectedAccount1 = AccountManager.accounts.isNotEmpty
      ? "                     "
      : 'No accounts available';
  String selectedAccount2 = AccountManager.accounts.isNotEmpty
      ? "                     "
      : 'No accounts available';
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

  void _showAccountPicker(BuildContext context, bool check) async {
    final selectedAccount = check ? selectedAccount1 : selectedAccount2;
    final selected = await showDialog<Account>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(
            child: Text(
              check ? 'Select Account 1' : 'Select Account 2',
              style: TextStyle(
                color: Colors.deepPurple,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView(
              shrinkWrap: true,
              children: AccountManager.accounts
                  .map<Widget>((account) => Card(
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: ListTile(
                          title: Text(
                            account.name,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          leading: Icon(
                            Icons.account_circle,
                            color: Colors.deepPurple,
                          ),
                          tileColor: selectedAccount == account.name
                              ? Colors.deepPurple.withOpacity(0.2)
                              : null,
                          onTap: () {
                            Navigator.pop(context, account);
                          },
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 8.0,
                          ),
                        ),
                      ))
                  .toList(),
            ),
          ),
        );
      },
    );
    if (selected != null) {
      setState(() {
        check
            ? selectedAccount1 = selected.name
            : selectedAccount2 = selected.name;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            LineOfAddTrans(
              fun: () => _pickDate(),
              text: 'Date       ',
              content: format.format(_selectedDate),
            ),
            const Gap(15),
            LineOfAddTrans(
              fun: () => _showAccountPicker(context, true),
              text: 'Account 1',
              content: selectedAccount1,
            ),
            const Gap(15),
            LineOfAddTrans(
              fun: () => _showAccountPicker(context, false),
              text: 'Account 2',
              content: selectedAccount2,
            ),
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
