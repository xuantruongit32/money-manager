
import 'package:uuid/uuid.dart';

var uuid = const Uuid();

enum Type { Income, Expense, Transfer }

class Trans {
  Trans(
      {required this.note,
      required this.amount,
      required this.date,
      required this.category,
      required this.accId,
      required this.type})
      : id = uuid.v4();
  final String note;
  final double amount;
  final DateTime date;
  final String id;
  final String category;
  final String accId;
  final Type type;
  String acc2Id = '';

  String stringType() {
    if (type == Type.Income) {
      return 'Income';
    } else if (type == Type.Expense) {
      return 'Expense';
    } else {
      return 'Transfer';
    }
  }
}
