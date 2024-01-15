import 'package:uuid/uuid.dart';
import 'package:moneyManager/services/models/account.dart';

var uuid = const Uuid();

class Income {
  Income(
      {required this.title,
      required this.amount,
      required this.date,
      required this.category,
      required this.acc})
      : id = uuid.v4();
  String title = '';
  final double amount;
  final DateTime date;
  final String id;
  final String category;
  final Account acc;
}
