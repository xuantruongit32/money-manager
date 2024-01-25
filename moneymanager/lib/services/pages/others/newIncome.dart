import 'package:flutter/material.dart';
import 'package:moneyManager/services/pages/reusable/lineOfAddTrans.dart';
import 'package:moneyManager/services/pages/reusable/addTextField.dart';
import 'package:moneyManager/services/pages/reusable/auth/errorDialog.dart';
import 'package:line_icons/line_icons.dart';
import 'package:gap/gap.dart';
import 'package:moneyManager/services/pages/reusable/auth/authButton.dart';
import 'package:intl/intl.dart';
import 'package:moneyManager/services/functions/account_manager.dart';
import 'package:moneyManager/services/functions/transaction_category_manager.dart';
import 'package:moneyManager/services/models/account.dart';
import 'package:moneyManager/services/models/transaction.dart';
import 'package:moneyManager/services/functions/checkData.dart';

class NewIncome extends StatefulWidget {
  NewIncome({required this.addTrans, Key? key}) : super(key: key);

  final Function addTrans;
  @override
  _NewIncomeState createState() => _NewIncomeState();
}

class _NewIncomeState extends State<NewIncome> {
  Account selectedAccount = Account.empty();
  String showAccount = AccountManager.accounts.isNotEmpty
      ? "                     "
      : 'No accounts available';
  String showCategory = TransactionCategoryManager.incomeCategories.isNotEmpty
      ? "                   "
      : 'No category available';
  String selectedCategory = '';

  var format = DateFormat('d/M/yyyy (E)');
  var _selectedDate = DateTime.now();
  final _amountController = TextEditingController();
  final _noteController = TextEditingController();

  @override
  void dispose() {
    _amountController.dispose();
    _noteController.dispose();
    super.dispose();
  }

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
        return AlertDialog(
          title: Center(
            child: Text(
              'Select Account',
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
                          tileColor: selectedAccount.name == account.name
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
        selectedAccount = selected;
        showAccount = selected.name;
      });
    }
  }

  void submitData() {
    if (CheckData(
            amount: _amountController.text,
            account: selectedAccount,
            category: selectedCategory)
        .checkDataTrans()) {
      Transaction newIncome = Transaction(
          date: _selectedDate,
          note: _noteController.text,
          amount: double.parse(_amountController.text),
          acc: selectedAccount,
          category: selectedCategory,
          type: Type.Income);
      widget.addTrans(newIncome);
    } else {
      showDialog(
        context: context,
        builder: (context) => ErrorDialog(
          errorMessage: 'Failed to save income, try again',
        ),
      );
    }
  }

  void _showCategoryPicker(BuildContext context) async {
    final selected = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(
            child: Text(
              'Select Category',
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
              children: TransactionCategoryManager.incomeCategories
                  .map<Widget>((category) => Card(
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: ListTile(
                          title: Text(
                            category,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          leading: Icon(
                            Icons.food_bank,
                            color: Colors.deepPurple,
                          ),
                          tileColor: selectedCategory == category
                              ? Colors.deepPurple.withOpacity(0.2)
                              : null,
                          onTap: () {
                            Navigator.pop(context, category);
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
        selectedCategory = selected;
        showCategory = selected;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            LineOfAddTrans(
              fun: () => _pickDate(),
              text: 'Date       ',
              content: format.format(_selectedDate),
            ),
            const Gap(13),
            LineOfAddTrans(
              fun: () => _showAccountPicker(context),
              text: 'Account ',
              content: showAccount,
            ),
            const Gap(13),
            LineOfAddTrans(
              fun: () => _showCategoryPicker(context),
              text: 'Category',
              content: showCategory,
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
            AuthButton(buttonText: 'Save', fun: submitData)
          ],
        ),
      ),
    );
  }
}
