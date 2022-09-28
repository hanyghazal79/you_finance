import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:you_finance/models/database/fireauth.dart';
import 'package:you_finance/models/database/sqflitedb.dart';

class WelcomeUserViewModel extends ChangeNotifier {
  String message = "";

  signUp(
      {required String email,
      required String password,
      required String passwordConfirm}) {
    if (email == "" || password == "" || passwordConfirm == "") {
      message = "Please, fill missing value";
      notifyListeners();
    } else if (password != passwordConfirm) {
      message = "Password fields provide non-identical values";
      notifyListeners();
    } else {
      FireAuth.instance.signUp(email: email, password: password).then((value) {
        if (value == null) {
          message = "You have signed up successfully";
        } else {
          message = value;
        }
      });
      notifyListeners();
      // SqfLiteDB.instance.i;

    }
  }

  signIn({required String email, required String password}) {
    if (email == "" || password == "") {
      message = "Please, fill missing value";
      notifyListeners();
    } else {
      FireAuth.instance.signIn(email: email, password: password);
      message = "You have signed in successfully";
      notifyListeners();
    }
  }

  signOut() {
    FireAuth.instance.signOut();
    message = "You are now out";
    notifyListeners();
  }
}
