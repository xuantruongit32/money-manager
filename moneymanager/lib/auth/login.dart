import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:moneyManager/services/pages/reusable/textfieldOfauth.dart';
import 'package:moneyManager/services/pages/reusable/squareTileofAuth.dart';
import 'package:moneyManager/services/pages/reusable/authButton.dart';
import 'package:moneyManager/services/pages/reusable/errorDialog.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  void signUserIn() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: usernameController.text, password: passwordController.text);
    } catch (e) {
      Navigator.pop(context);
      showDialog(
          context: context,
          builder: (context) {
            return ErrorDialog(
                errorMessage: "Failed to sign in, please try again");
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "HELLO AGAIN!",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Gap(10),
            Text(
              "Welcome back, you've been missed",
              style: TextStyle(fontSize: 15),
            ),
            const Gap(10),
            AuthTextField(
              controller: usernameController,
              hintText: 'Email',
              secure: false,
            ),
            const Gap(12),
            AuthTextField(
              controller: passwordController,
              hintText: 'Password',
              secure: true,
            ),
            const Gap(20),
            AuthButton(buttonText: 'Sign In', fun: signUserIn),
            const Gap(10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('Forgot Password?'),
                ],
              ),
            ),
            const Gap(30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.grey,
                    ),
                  ),
                  Text('Or continue with',
                      style: TextStyle(
                        color: Colors.grey,
                      )),
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            const Gap(30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AuthSquareTile(imagePath: 'assets/images/google.png'),
                const Gap(25),
                AuthSquareTile(imagePath: 'assets/images/facebook.png'),
              ],
            ),
            const Gap(30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Not a member? ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  'Register now',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
