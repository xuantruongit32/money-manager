import 'package:uuid/uuid.dart';

var uuid = const Uuid();

class Account {
  Account({required this.name, required this.amount, required this.group})
      : id = uuid.v4();
  Account.empty()
      : name = '',
        amount = 0,
        group = '',
        id = '';
  String name;
  double amount = 0;
  String group;
  String description = '';
  final String id;
}
