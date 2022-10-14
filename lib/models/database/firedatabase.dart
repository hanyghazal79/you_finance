import 'package:firebase_database/firebase_database.dart';

class FireDatabase {
  FireDatabase._internal();
  static final FireDatabase instance = FireDatabase._internal();
  factory FireDatabase() => instance;

  final FirebaseDatabase _firebaseDatabase = FirebaseDatabase.instance;

  insert({required String path, required Object object}) async {
    DatabaseReference ref = _firebaseDatabase.ref().child(path);
    String? key = ref.push().key;
    await ref.child(key!).set(object);
  }

  retrieveAll({required String path}) async {
    DatabaseReference ref = _firebaseDatabase.ref().child(path);
    await ref.get();
  }
}
