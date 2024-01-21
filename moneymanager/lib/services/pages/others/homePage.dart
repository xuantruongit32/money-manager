import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:moneyManager/services/pages/tabs/account.dart';
import 'package:moneyManager/services/pages/tabs/trans.dart';
import 'package:moneyManager/services/pages/tabs/more.dart';
import 'package:moneyManager/services/pages/tabs/stats.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  var _currentIndex = 0;

  final tabs = [
    Trans(),
    Stats(),
    Account(),
    More(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
          onPressed: signUserOut,
          icon: Icon(Icons.logout),
        )
      ]),
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.black,
        fixedColor: Colors.red.shade500,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Trans'),
          BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_rounded), label: 'Stats'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_balance), label: 'Account'),
          BottomNavigationBarItem(icon: Icon(Icons.more), label: 'More'),
        ],
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
