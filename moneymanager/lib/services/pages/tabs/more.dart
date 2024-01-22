import 'package:flutter/material.dart';
import 'package:moneyManager/services/pages/reusable/iconButtonText.dart';
import 'package:gap/gap.dart';
import 'package:firebase_auth/firebase_auth.dart';

class More extends StatelessWidget {
  const More({Key? key}) : super(key: key);
  void _signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButtonText(
                fun: () {},
                label: 'Settings',
                icon: Icon(Icons.settings),
              ),
              IconButtonText(
                fun: () {},
                label: 'Personal',
                icon: Icon(
                  Icons.person,
                ),
              ),
              IconButtonText(
                fun: () {},
                label: 'Style',
                icon: Icon(
                  Icons.style,
                ),
              ),
            ],
          ),
          const Gap(50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButtonText(
                fun: () {},
                label: 'Feedback',
                icon: Icon(Icons.feedback),
              ),
              IconButtonText(
                fun: () {},
                label: 'Help',
                icon: Icon(Icons.question_mark),
              ),
              IconButtonText(
                fun: () {
                  FirebaseAuth.instance.signOut();
                },
                label: 'Sign Out',
                icon: Icon(
                  Icons.logout,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
