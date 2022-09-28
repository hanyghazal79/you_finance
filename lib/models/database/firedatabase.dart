import 'package:firebase_database/firebase_database.dart';

class FireDatabase{
  FireDatabase._internal();
  static final FireDatabase instance = FireDatabase._internal();
  factory FireDatabase() => instance;

  final FirebaseDatabase _firebaseDatabase = FirebaseDatabase.instance;


}