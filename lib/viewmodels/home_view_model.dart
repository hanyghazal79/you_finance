import 'package:flutter/cupertino.dart';
import 'package:you_finance/views/clients.dart';
import 'package:you_finance/views/dashboard.dart';
import 'package:you_finance/views/new_supplier.dart';
import 'package:you_finance/views/settings.dart';
import 'package:you_finance/views/suppliers.dart';
import 'package:you_finance/views/welcomeuser.dart';
import 'package:you_finance/widgets/welcome.dart';

class HomeViewModel extends ChangeNotifier {
  Widget widget = WelcomeUser(
    title: "Login",
  );

  setHomeWidget({Widget? widget}) {
    widget = widget;
    notifyListeners();
  }

  setHomeWidgetFromIndex({int? index}) {
    switch (index) {
      case 0:
        widget = Dashboard();
        notifyListeners();
        break;
      case 1:
        widget = Suppliers();
        notifyListeners();
        break;
      case 2:
        widget = Clients();
        notifyListeners();
        break;
      case 3:
        widget = Settings();
        notifyListeners();
        break;
      default:
        widget = Welcome();
        notifyListeners();
    }
  }

  setHomeWidgetFromTask({String? task}) {
    switch (task) {
      case "new supplier": // to create static values file //
        widget = NewSupplier();
        notifyListeners();
        break;
      default:
        widget = Container();
        notifyListeners();
    }
  }
}
