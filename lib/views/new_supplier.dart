import 'dart:html';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:you_finance/views/home.dart';
import 'package:you_finance/views/suppliers.dart';
import 'package:you_finance/widgets/new_supplier_form.dart';

class NewSupplier extends StatefulWidget {
  const NewSupplier({Key? key}) : super(key: key);

  @override
  State<NewSupplier> createState() => _NewSupplierState();
}

class _NewSupplierState extends State<NewSupplier> {

  late Widget _body;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('New supplier')),
      body: NewSupplierForm(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        onPressed: (() =>
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => Home(
                      body: Suppliers(),
                    )))),
      ),
    );
  }
}
