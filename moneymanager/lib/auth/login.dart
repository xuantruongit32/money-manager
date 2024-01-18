import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:moneyManager/services/pages/reusable/textfieldOfauth.dart';
import 'package:moneyManager/services/pages/reusable/squareTileofAuth.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
              hintText: 'Email',
              secure: false,
            ),
            const Gap(15),
            AuthTextField(
              hintText: 'Password',
              secure: true,
            ),
            const Gap(20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
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
            const Gap(50),
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
            const Gap(50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AuthSquareTile(imagePath: 'assets/images/google.png'),
                const Gap(25),
                AuthSquareTile(imagePath: 'assets/images/facebook.png'),
              ],
            ),
            const Gap(50),
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
