import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:moneyManager/services/pages/reusable/iconButtonText.dart';
import 'package:moneyManager/services/pages/reusable/customIcon.dart';
import 'package:gap/gap.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:moneyManager/services/pages/tabs/feedback.dart';

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
                icon: CustomIcon(imagePath: 'assets/icon/setting.png'),
              ),
              IconButtonText(
                fun: () {},
                label: 'Personal',
                icon: CustomIcon(
                  imagePath: 'assets/icon/personal.png',
                ),
              ),
              IconButtonText(
                fun: () {},
                label: 'Style',
                icon: CustomIcon(imagePath: 'assets/icon/style.png'),
              ),
            ],
          ),
          const Gap(50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButtonText(
                fun: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FeedBack(),
                  ),
                ),
                label: 'Feedback',
                icon: CustomIcon(imagePath: 'assets/icon/feedback.png'),
              ),
              IconButtonText(
                fun: () {},
                label: 'Help',
                icon: CustomIcon(imagePath: 'assets/icon/help.png'),
              ),
              IconButtonText(
                fun: () {
                  FirebaseAuth.instance.signOut();
                  GoogleSignIn().signOut();
                  GoogleSignIn().disconnect();
                },
                label: 'Sign Out',
                icon: CustomIcon(imagePath: 'assets/icon/logout.png'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
