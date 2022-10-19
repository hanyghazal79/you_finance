

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:you_finance/viewmodels/home_view_model.dart';
import 'package:you_finance/viewmodels/person_view_model.dart';
import 'package:you_finance/viewmodels/welcomeuser_viewmodel.dart';
import 'package:you_finance/views/home.dart';
import 'package:provider/provider.dart';
import 'package:you_finance/views/welcomeuser.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyBgC8CeKqoEy_UtiDvwC3wyzjxTYN4Hn3k",
        projectId: "you-finance-14ed2",
        appId: "you-finance-14ed2",
        messagingSenderId: 'xxx',
        databaseURL: "https://you-finance-14ed2-default-rtdb.firebaseio.com/"),
  );
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
    supportedLocales: const [
      Locale('en', 'US'),
      Locale('ar', 'DZ'),
    ],
    path: 'assets/languages',
    child: MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeViewModel()),
        ChangeNotifierProvider(create: (context) => WelcomeUserViewModel()),
        ChangeNotifierProvider(create: (context) => PersonViewModel())
      ],
      child: const MyApp(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Home(
          body: const WelcomeUser(title: "Login"),
          // body: Welcome(),
        ));
  }
}
