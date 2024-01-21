import 'package:firebase_auth/firebase_auth.dart';
import 'package:moneyManager/services/pages/reusable/errorDialog.dart';
import 'package:flutter/material.dart';

class ResetPassword {
  ResetPassword({required this.email, required this.context});
  final email;
  final BuildContext context;
  Future resetPassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Thank You'),
          content: Text('Please check your email.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) =>
            ErrorDialog(errorMessage: "Sorry, please try again"),
      );
    }
  }
}
