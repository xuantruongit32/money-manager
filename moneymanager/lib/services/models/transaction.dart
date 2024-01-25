import 'package:uuid/uuid.dart';
import 'package:moneyManager/services/models/account.dart';

var uuid = const Uuid();

enum Type { Income, Expense }

class Transaction {
  Transaction(
      {required this.note,
      required this.amount,
      required this.date,
      required this.category,
      required this.acc,
      required this.type})
      : id = uuid.v4();
  final String note;
  final double amount;
  final DateTime date;
  final String id;
  final String category;
  final Account acc;
  final Type type;
}
