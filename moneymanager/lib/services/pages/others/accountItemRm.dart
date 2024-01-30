import 'package:flutter/material.dart';

class AccountItemRm extends StatelessWidget {
  const AccountItemRm({Key? key, required this.account}) : super(key: key);

  final account;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(account.name),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.remove_circle,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
