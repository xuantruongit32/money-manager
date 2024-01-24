import 'package:uuid/uuid.dart';
import 'package:moneyManager/services/models/account.dart';

var uuid = const Uuid();

class Transfer {
  Transfer(
      {required this.acc1,
      required this.acc2,
      required this.note,
      required this.amount,
      required this.date})
      : id = uuid.v4(),
        currency = 'VND';
  final String note ;
  final Account acc1;
  final Account acc2;
  final double amount;
  final DateTime date;
  final String id;
  String currency;
}
