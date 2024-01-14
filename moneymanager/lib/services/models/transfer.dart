import 'package:uuid/uuid.dart';

var uuid = const Uuid();

class Transfer {
  Transfer({required this.title, required this.amount, required this.date})
      : id = uuid.v4();
  String title = '';
  final double amount;
  final DateTime date;
  final String id;
}
