import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:moneyManager/network/fire_store.dart';
import 'package:moneyManager/services/functions/transaction_manager.dart';
import 'firebase_options.dart';
import 'package:moneyManager/auth/authPage.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(MoneyManager()));
}

class MoneyManager extends StatefulWidget {
  MoneyManager({Key? key}) : super(key: key);

  @override
  _MoneyManagerState createState() => _MoneyManagerState();
}

class _MoneyManagerState extends State<MoneyManager>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.inactive) {
      FireStore().addTransactionToFireStore(TransactionManager.trans);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthPage(),
    );
  }
}
