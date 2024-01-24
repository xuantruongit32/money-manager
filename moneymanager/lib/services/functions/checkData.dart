import 'package:moneyManager/services/models/account.dart';

class CheckData {
  CheckData(
      {required this.amount,
      required this.account,
      required this.category});
  final String amount;
  final Account account;
  final String category;
  bool checkDataTrans() {
    final enteredAmount = double.tryParse(amount);
    final bool checkAmount = enteredAmount == null || enteredAmount <= 0;
    if (checkAmount || account.id == '' || category == '') {
      return false;
    }
    return true;
  }
}
