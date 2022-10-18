import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:you_finance/views/home.dart';
import 'package:you_finance/views/new_person_form.dart';

class Persons extends StatefulWidget {
  const Persons({Key? key, required this.type}) : super(key: key);
  final type;

  @override
  State<Persons> createState() => _PersonsState();
}

class _PersonsState extends State<Persons> {
  late ChangeNotifier _changeNotifier;

  Widget _title = Text("");
  Widget _body = Container();
  Icon _icon = Icon(Icons.add);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _title = (widget.type == 'Suppliers')? const Text('Suppliers') : const Text('Clients');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _title,
      ),
      body: _body,
      floatingActionButton: FloatingActionButton(
          child: _icon,
          onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => Home(
                        body: NewPersonForm(
                      type: 'Supplier',
                    ))));
          }),
    );
  }
}
