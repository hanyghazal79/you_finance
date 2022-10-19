import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:you_finance/models/person.dart';
import 'package:you_finance/models/client.dart';
import 'package:you_finance/models/supplier.dart';
import 'package:you_finance/static_members/instances.dart';
import 'package:you_finance/static_members/strings.dart';
import 'package:you_finance/viewmodels/person_view_model.dart';
import 'package:you_finance/views/home.dart';
import 'package:you_finance/views/persons.dart';

class NewPersonForm extends StatefulWidget {
  const NewPersonForm({Key? key, required this.type}) : super(key: key);
  final String type;
  @override
  State<NewPersonForm> createState() => _NewPersonFormState();
}

class _NewPersonFormState extends State<NewPersonForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  late PersonViewModel _viewModel;
  String _message = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _viewModel = Provider.of<PersonViewModel>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          width: MediaQuery.of(context).size.width / 3,
          height: MediaQuery.of(context).size.height * 0.7,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              border: Border.all(
                  color: Colors.grey, style: BorderStyle.solid, width: 3)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: (widget.type == 'Suppliers')
                          ? "Supplier name"
                          : "Client name",
                      hintStyle: const TextStyle(
                          fontStyle: FontStyle.italic, color: Colors.grey)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: TextFormField(
                  controller: _phoneController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: (widget.type == 'Suppliers')
                          ? "Supplier phone"
                          : "Client phone",
                      hintStyle: const TextStyle(
                          fontStyle: FontStyle.italic, color: Colors.grey)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: TextFormField(
                  controller: _addressController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: (widget.type == 'Suppliers')
                          ? "Supplier address"
                          : "Client address",
                      hintStyle: const TextStyle(
                          fontStyle: FontStyle.italic, color: Colors.grey)),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 15,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: ElevatedButton(
                  onPressed: insertPerson,
                  child: Text((widget.type == 'Suppliers')
                      ? "ADD SUPPLIER"
                      : "ADD CLIENT"),
                ),
              )
            ],
          )),
    );
  }

  insertPerson() {

    Person person;
    String? key;
    if (widget.type == 'Suppliers') {
      setState(() {
        Strings.path = "SUPPLIERS";
        Instances.databaseReference = Instances.suppliersReference;
        key = Instances.databaseReference!.push().key;
      });
      person = Supplier(
          key:key,
          name: _nameController.value.text,
          phone: _phoneController.value.text,
          address: _addressController.value.text);
    } else {
      setState(() {
        Strings.path = "CLIENTS";
        Instances.databaseReference = Instances.clientsReference;
        key = Instances.databaseReference!.push().key;
      });
      person = Client(
        key: key,
          name: _nameController.value.text,
          phone: _phoneController.value.text,
          address: _addressController.value.text);
    }
    _viewModel.insert(reference: Instances.databaseReference, key: key!, object: person.toMap());
    setState(() {
      _message = _viewModel.message;
    });
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(_message)));
    if (_viewModel.isComplete == false) {
      return;
    } else {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => Home(body: Persons(type: (widget.type == 'Suppliers')?'Suppliers' : 'Clients'))));
    }
  }
}
