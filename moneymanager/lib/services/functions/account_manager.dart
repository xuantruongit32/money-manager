import 'package:moneyManager/services/models/account.dart';

class AccountManager {
  static List<String> group = ['cash', 'card'];
  static List<Account> accounts = [
    Account(amount: 30, group: group[0], name: 'Test'),
    Account(amount: 30, group: group[0], name: 'Test'),
    Account(amount: 30, group: group[0], name: 'Test'),
  ];

  static void addAccount(Account acc) {
    accounts.add(acc);
  }

  static void removeAccount(Account acc) {
    accounts.remove(acc);
  }
}
