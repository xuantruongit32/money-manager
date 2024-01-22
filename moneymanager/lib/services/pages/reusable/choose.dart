import 'package:flutter/material.dart';

class Choose extends StatelessWidget {
  const Choose({required this.selected, required this.list, Key? key})
      : super(key: key);
  final selected;
  final list;
  @override
  Widget build(BuildContext context) {
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
          children: list
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
                      tileColor: selected == account.name
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
  }
}
