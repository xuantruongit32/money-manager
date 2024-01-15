import 'package:flutter/material.dart';
import 'package:moneyManager/services/pages/tabs/account.dart';
import 'package:moneyManager/services/pages/tabs/trans.dart';
import 'package:moneyManager/services/pages/tabs/more.dart';
import 'package:moneyManager/services/pages/tabs/stats.dart';

void main() {
  runApp(MoneyManager());
}

class MoneyManager extends StatefulWidget {
  MoneyManager({Key? key}) : super(key: key);

  @override
  _MoneyManagerState createState() => _MoneyManagerState();
}

class _MoneyManagerState extends State<MoneyManager> {
  var _currentIndex = 0;

  final tabs = [
    Trans(),
    Stats(),
    Account(),
    More(),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: tabs[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.black,
          fixedColor: Colors.red.shade500,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Trans'),
            BottomNavigationBarItem(icon: Icon(Icons.chair), label: 'Stats'),
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
      ),
    );
  }
}
