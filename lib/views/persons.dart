import 'package:flutter/material.dart';
import 'package:you_finance/views/home.dart';
import 'package:you_finance/views/new_person_form.dart';
import 'package:you_finance/widgets/persons_list.dart';

class Persons extends StatefulWidget {
  const Persons({Key? key, required this.type}) : super(key: key);
  final String type;

  @override
  State<Persons> createState() => _PersonsState();
}

class _PersonsState extends State<Persons> {

  Widget _title = const Text("");
  final Icon _icon = const Icon(Icons.add);
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
      body: PersonsList(type: widget.type),
      floatingActionButton: FloatingActionButton(
          child: _icon,
          onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => Home(
                        body: NewPersonForm(
                      type: widget.type,
                    ))));
          }),
    );
  }
}
