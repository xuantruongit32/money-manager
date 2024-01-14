import 'package:moneymanager/services/models/account.dart';

class AccountManager {
  static List<String> group = ['cash', 'card'];
  static List<Account> accounts = [];

  static void addAccount(Account acc) {
    accounts.add(acc);
  }

  static void removeAccount(Account acc) {
    accounts.remove(acc);
  }
}
