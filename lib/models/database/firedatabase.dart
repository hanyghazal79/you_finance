import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class FireDatabase {
  FireDatabase._internal();
  static final FireDatabase instance = FireDatabase._internal();
  factory FireDatabase() {
    return instance;
  }

  final FirebaseDatabase firebaseDatabase = FirebaseDatabase.instance;

  Future<String?> insert({required DatabaseReference databaseReference, required String key, required Object object}) async {
    try {
      await databaseReference.child(key).set(object);
      return null;
    } on FirebaseException catch (e) {
      return e.toString();
    }
  }

  retrieveAll({required String path}) async {
    DatabaseReference ref = firebaseDatabase.ref().child(path);
    await ref.get();
  }
}
