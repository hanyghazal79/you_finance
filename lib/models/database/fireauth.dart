import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class FireAuth {
  FireAuth._internal();
  static final FireAuth instance = FireAuth._internal();
  factory FireAuth() {
    return instance;
  }
  final FirebaseAuth auth = FirebaseAuth.instance;
  // User? get currentUser => _auth.currentUser;

  Future signUp({required String email, required String password}) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<User?> signIn(
      {required String email, required String password}) async {
    User? user;
    await auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) => user = value.user);
    return user;
  }

  Future signOut() async {
    await auth.signOut();
  }
}
