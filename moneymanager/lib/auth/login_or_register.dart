import 'package:flutter/material.dart';
import 'package:moneyManager/auth/login.dart';
import 'package:moneyManager/auth/register.dart';

class LoginOrRegister extends StatefulWidget {
  LoginOrRegister({Key? key}) : super(key: key);

  @override
  _LoginOrRegisterState createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  bool showLoginPage = true;
  void changePage() {
    setState(() {
      showLoginPage = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return (showLoginPage
        ? Login(
            onTap: changePage,
          )
        : Register());
  }
}
