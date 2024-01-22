import 'package:flutter/material.dart';
import 'package:moneyManager/services/pages/others/newTransaction.dart';


class Trans extends StatelessWidget {
  const Trans({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => NewTransaction()));
          },
          child: Icon(Icons.add),
        ),
        body: Center(
          child: Text('Trans'),
        ));
  }
}
