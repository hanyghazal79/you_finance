import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:you_finance/viewmodels/home_view_model.dart';
import 'package:you_finance/views/home.dart';
import 'package:you_finance/views/new_supplier.dart';

class Suppliers extends StatefulWidget {
  const Suppliers({Key? key}) : super(key: key);

  @override
  State<Suppliers> createState() => _SuppliersState();
}

class _SuppliersState extends State<Suppliers> {
  late HomeViewModel _homeViewModel;
  Widget _title = Text("Suppliers");
  Widget _body = Container(
    color: Colors.black,
  );
  Icon _icon = Icon(Icons.add);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _homeViewModel = Provider.of<HomeViewModel>(context, listen: false);
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
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => Home(body: NewSupplier())));
          }),
    );
  }
}
