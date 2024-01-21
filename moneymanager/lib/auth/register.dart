import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:moneyManager/services/pages/reusable/textfieldOfauth.dart';
import 'package:moneyManager/services/pages/reusable/squareTileofAuth.dart';
import 'package:moneyManager/services/pages/reusable/authButton.dart';
import 'package:moneyManager/services/pages/reusable/errorDialog.dart';
import 'package:moneyManager/services/functions/google_auth_service.dart';

class Register extends StatefulWidget {
  Register({required this.onTap, Key? key}) : super(key: key);
  final Function() onTap;

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  void signUserUp() async {
    try {
      if (passwordController.text == confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: usernameController.text, password: passwordController.text);
      } else {
        showDialog(
            context: context,
            builder: (context) {
              return ErrorDialog(errorMessage: "Password not match");
            });
      }
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) {
            return ErrorDialog(
                errorMessage: "Failed to sign up, please try again");
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //safeArea: avoid certain system-defined areas
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
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
                  "Join today.",
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
                const Gap(12),
                AuthTextField(
                  controller: confirmPasswordController,
                  hintText: 'Confirm Password',
                  secure: true,
                ),
                const Gap(20),
                AuthButton(buttonText: 'Sign Up', fun: signUserUp),
                const Gap(10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
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
                    AuthSquareTile(
                      imagePath: 'assets/images/google.png',
                      onTap: () => GoogleAuthService().signInWithGoogle(),
                    ),
                    const Gap(25),
                    AuthSquareTile(
                      imagePath: 'assets/images/facebook.png',
                      onTap: () => GoogleAuthService().signInWithGoogle(),
                    ),
                  ],
                ),
                const Gap(30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account? ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text(
                        'Login now',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
