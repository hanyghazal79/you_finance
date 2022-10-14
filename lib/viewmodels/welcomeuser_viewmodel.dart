import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:you_finance/models/database/fireauth.dart';
import 'package:you_finance/models/database/sqflitedb.dart';
import 'package:you_finance/static_members/instances.dart';
import 'package:you_finance/static_members/strings.dart';
import 'package:you_finance/views/dashboard.dart';
import 'package:you_finance/views/home.dart';
import 'package:you_finance/views/welcomeuser.dart';

class WelcomeUserViewModel extends ChangeNotifier {
  String message = "";

  signUp(
      {required String email,
      required String password,
      required String passwordConfirm}) async {
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
          notifyListeners();
        }
      });
    }
  }

  signUpLocally({required String email, required String password}) {
    Instances.localDB.insert(
        table: Strings.usersTableName,
        values: {"email": email, "password": password}).then((value) {
      if (value == 0) {
        message = "No transactions in local database";
        notifyListeners();
      } else {
        message = "You have signed up successfully";
        notifyListeners();
      }
    });
  }

 signIn({required String email, required String password}) async {
    if (email == "" || password == "") {
      message = "Please, fill missing value";
      notifyListeners();
    } else {
      FireAuth.instance.signIn(email: email, password: password);
      message = "You have signed in successfully";
      notifyListeners();
    }
  }

  signInLocally({required String email, required String password}) {
    Instances.localDB.insert(table: Strings.loginTableName, values: {
      "datetime": DateTime.now(),
      "email": email,
      "password": password
    }).then((value) {
      message = (value == 0)
          ? "No transactions in local database"
          : "Successful login at local database at ${DateTime.now()}";
      notifyListeners();
    });
  }

  signOut() async {
    await FireAuth.instance.signOut();
    message = "You are now out";
    notifyListeners();
  }
}
