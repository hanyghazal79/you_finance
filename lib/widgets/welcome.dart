// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:you_finance/static_members/instances.dart';
import 'package:you_finance/static_members/strings.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  List<Map<String, Object?>>? _list;
  @override
  void initState() {
    super.initState();
    Instances.localDB.retrieve(sql: "SELECT * FROM users").then((value) {
      setState(() {
        _list = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: Text(_list.toString()));
  }
}
