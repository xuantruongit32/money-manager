import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:moneyManager/services/functions/transaction_category_manager.dart';
import 'package:moneyManager/services/pages/others/categoryItem.dart';

class CategoryPage extends StatefulWidget {
  CategoryPage({Key? key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  void _removeCategory(String category) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Center(child: Text('Confirm remove')),
        content: Text('Are you sure want to remove category?'),
        actions: [
          ElevatedButton(
            onPressed: () {
              setState(() {
                TransactionCategoryManager.removeIncomeCategory(category);
                TransactionCategoryManager.removeExpenseCategory(category);
              });
              Navigator.pop(context);
            },
            child: Text('OK'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
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
        title: Text('Category'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Income Category',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black45,
                ),
              ),
            ),
            Column(
              children: TransactionCategoryManager.incomeCategories
                  .map(
                    (e) => CategoryItem(
                      category: e,
                      removeCategory: _removeCategory,
                    ),
                  )
                  .toList(),
            ),
            const Gap(10),
            DottedBorder(
              child: Container(
                width: MediaQuery.of(context).size.width - 30,
                child: Center(
                  child: Text(
                    '+',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              padding: EdgeInsets.all(12),
            ),
            const Gap(50),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Expense Category',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black45,
                ),
              ),
            ),
            Column(
              children: TransactionCategoryManager.expenseCategories
                  .map(
                    (e) => CategoryItem(
                      category: e,
                      removeCategory: _removeCategory,
                    ),
                  )
                  .toList(),
            ),
            const Gap(10),
            DottedBorder(
              child: Container(
                width: MediaQuery.of(context).size.width - 30,
                child: Center(
                  child: Text(
                    '+',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              padding: EdgeInsets.all(12),
            ),
          ],
        ),
      ),
    );
  }
}
