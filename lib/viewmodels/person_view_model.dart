import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:you_finance/models/person.dart';
import 'package:you_finance/models/database/firedatabase.dart';
import 'package:you_finance/static_members/strings.dart';

class PersonViewModel extends ChangeNotifier {
  String message = "";
  bool isComplete = false;

  insert({required DatabaseReference? reference, required String key, required Object object}) async {
    await FireDatabase.instance
        .insert(databaseReference: reference!, key: key, object: object)
        .then((value) {
      if (value == null) {
        message = "Successful addition of a new person";
        notifyListeners();
        isComplete = true;
        notifyListeners();
      } else {
        message = value;
        notifyListeners();
        isComplete = false;
        notifyListeners();
      }
    });
  }
}
