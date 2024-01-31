import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireStore {
  String? getUserId() {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;

    if (user != null) {
      return user.uid;
    } else {
      return null;
    }
  }

  Future<void> addTransactionToFireStore(var tran) async {
    final userId = getUserId();

    CollectionReference transactionsCollection =
        FirebaseFirestore.instance.collection('users/$userId/transactions');
    await transactionsCollection.doc(tran.id).set({
      'note': tran.note,
      'amount': tran.amount,
      'date': tran.date,
      'id': tran.id,
      'category': tran.category,
      'accountId': tran.acc.id,
      'type': tran.type.toString(),
    });
  }

  Future<void> removeTransactionToFireStore(var tran) async {
    final userId = getUserId();

    CollectionReference transactionsCollection =
        FirebaseFirestore.instance.collection('users/$userId/transactions');
    await transactionsCollection.doc(tran.id).delete();
  }

  Future<void> addIncomeCategoryToFireStore(String category) async {
    final userId = getUserId();
    CollectionReference categoryCollection =
        FirebaseFirestore.instance.collection('users/$userId/category');

    await categoryCollection.doc('income').update({
      category: category,
    });
  }

  Future<void> addExpenseCategoryToFireStore(String category) async {
    final userId = getUserId();
    CollectionReference categoryCollection =
        FirebaseFirestore.instance.collection('users/$userId/category');

    await categoryCollection.doc('expense').update({
      category: category,
    });
  }

  Future<void> removeIncomeCategoryFromFireStore(String category) async {
    final userId = getUserId();
    CollectionReference categoryCollection =
        FirebaseFirestore.instance.collection('users/$userId/category');
    await categoryCollection.doc('income').update({
      category: FieldValue.arrayRemove([category]),
    });
  }

  Future<void> removeExpenseCategoryFromFireStore(String category) async {
    final userId = getUserId();
    CollectionReference categoryCollection =
        FirebaseFirestore.instance.collection('users/$userId/category');
    await categoryCollection.doc('expense').update({
      category: FieldValue.arrayRemove([category]),
    });
  }

  Future<void> addAccountToFireStore(var acc) async {
    final userId = getUserId();

    CollectionReference transactionsCollection =
        FirebaseFirestore.instance.collection('users/$userId/accounts');
    await transactionsCollection.doc(acc.id).set({
      'amount': acc.amount,
      'id': acc.id,
      'name': acc.name,
    });
  }

  Future<void> removeAccountToFireStore(var acc) async {
    final userId = getUserId();
    CollectionReference accountCollection =
        FirebaseFirestore.instance.collection('/users/$userId/accounts');
    await accountCollection.doc(acc.id).delete();
  }
}
