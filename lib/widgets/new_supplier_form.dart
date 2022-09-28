import 'package:flutter/material.dart';

class NewSupplierForm extends StatefulWidget {
  const NewSupplierForm({Key? key}) : super(key: key);

  @override
  State<NewSupplierForm> createState() => _NewSupplierFormState();
}

class _NewSupplierFormState extends State<NewSupplierForm> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          padding: EdgeInsets.only(left: 20, right: 20),
          width: MediaQuery.of(context).size.width / 3,
          height: MediaQuery.of(context).size.height * 0.7,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              border: Border.all(
                  color: Colors.grey, style: BorderStyle.solid, width: 3)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: "Supplier name",
                      hintStyle: TextStyle(
                          fontStyle: FontStyle.italic, color: Colors.grey)),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: TextFormField(
                  controller: _phoneController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: "Supplier phone",
                      hintStyle: TextStyle(
                          fontStyle: FontStyle.italic, color: Colors.grey)),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: TextFormField(
                  controller: _addressController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: "Supplier address",
                      hintStyle: const TextStyle(
                          fontStyle: FontStyle.italic, color: Colors.grey)),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 15,
                decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20))),
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('ADD SUPPLIER'),
                ),
              )
            ],
          )),
    );
  }
}
