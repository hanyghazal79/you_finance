import 'package:flutter/cupertino.dart';
import 'package:you_finance/views/dashboard.dart';
import 'package:you_finance/views/settings.dart';
import 'package:you_finance/views/persons.dart';
import 'package:you_finance/views/welcomeuser.dart';
import 'package:you_finance/widgets/welcome.dart';

class HomeViewModel extends ChangeNotifier {
  Widget widget = const WelcomeUser(
    title: "Login",
  );

  setHomeWidget({Widget? widget}) {
    widget = widget;
    notifyListeners();
  }

  setHomeWidgetFromIndex({int? index}) {
    switch (index) {
      case 0:
        widget = const Dashboard();
        notifyListeners();
        break;
      case 1:
        widget = const Persons(type: 'Suppliers');
        notifyListeners();
        break;
      case 2:
        widget = const Persons(type: 'Clients');
        notifyListeners();
        break;
      case 3:
        widget = const Settings();
        notifyListeners();
        break;
      default:
        widget = const Welcome();
        notifyListeners();
    }
  }

  // setHomeWidgetFromTask({String? task}) {
  //   switch (task) {
  //     case "new supplier": // to create static values file //
  //       widget = NewSupplier();
  //       notifyListeners();
  //       break;
  //     default:
  //       widget = Container();
  //       notifyListeners();
  //   }
  // }
}
