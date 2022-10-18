import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:sqflite/sqflite.dart';
import 'package:you_finance/models/database/firedatabase.dart';
import 'package:you_finance/models/database/sqflitedb.dart';

class Instances {
  static final LocalDB localDB = LocalDB();
  static User? user;
  static DatabaseReference? databaseReference;
  static final DatabaseReference suppliersReference = FirebaseDatabase.instance.ref('SUPPLIERS');
  static final DatabaseReference clientsReference = FirebaseDatabase.instance.ref('CLIENTS');

}
