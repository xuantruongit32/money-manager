import 'package:uuid/uuid.dart';

var uuid = const Uuid();

enum Category { food, entertain }

class Expense {
  Expense(
      {required this.title,
      required this.amount,
      required this.date,
      required this.category})
      : id = uuid.v4();
  String title = '';
  final double amount;
  final DateTime date;
  final String id;
  final Category category;
}
