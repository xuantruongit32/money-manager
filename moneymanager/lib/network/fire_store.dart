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
      'categories': category,
    });
  }

  Future<void> addExpenseCategoryToFireStore(String category) async {
    final userId = getUserId();
    CollectionReference categoryCollection =
        FirebaseFirestore.instance.collection('users/$userId/category');

    await categoryCollection.doc('expense').update({
      'categories': category,
    });
  }
}
