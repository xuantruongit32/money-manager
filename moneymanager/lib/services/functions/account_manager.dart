import 'package:moneyManager/services/models/account.dart';

class AccountManager {
  static List<String> group = ['cash', 'card'];
  static List<Account> accounts = [
    Account(amount: 30, group: group[0], name: 'Test1'),
    Account(amount: 30, group: group[0], name: 'Test2'),
    Account(amount: 30, group: group[0], name: 'Test3'),
    Account(amount: 30, group: group[0], name: 'Test4'),
    Account(amount: 30, group: group[0], name: 'Test5'),
    Account(amount: 30, group: group[0], name: 'Test6'),
  ];

  static void addAccount(Account acc) {
    accounts.add(acc);
  }

  static void removeAccount(Account acc) {
    accounts.remove(acc);
  }
}
