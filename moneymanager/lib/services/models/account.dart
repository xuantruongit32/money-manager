import 'package:uuid/uuid.dart';

var uuid = const Uuid();

class Account {
  Account({required this.name, required this.amount})
      : id = uuid.v4();
  Account.empty()
      : name = '',
        amount = 0,
        id = '';
  String name;
  double amount = 0;
  String description = '';
  final String id;
}
