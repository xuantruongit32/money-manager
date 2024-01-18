import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({required this.secure, required this.hintText, Key? key})
      : super(key: key);
  final String hintText;
  final bool secure;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.grey,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 10),
          child: TextField(
            obscureText: secure,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
            ),
          ),
        ),
      ),
    );
  }
}
