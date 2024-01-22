import 'package:flutter/material.dart';
import 'package:moneyManager/services/pages/tabs/account.dart';
import 'package:moneyManager/services/pages/tabs/trans.dart';
import 'package:moneyManager/services/pages/tabs/more.dart';
import 'package:moneyManager/services/pages/tabs/stats.dart';
import 'package:line_icons/line_icons.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      appBar: AppBar(),
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.black,
        fixedColor: Colors.red.shade500,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(LineIcons.moneyBill), label: 'Trans'),
          BottomNavigationBarItem(
              icon: Icon(LineIcons.pieChart), label: 'Stat'),
          BottomNavigationBarItem(
              icon: Icon(LineIcons.piggyBank), label: 'Account'),
          BottomNavigationBarItem(
              icon: Icon(LineIcons.horizontalEllipsis), label: 'More'),
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
