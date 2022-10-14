import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          width: MediaQuery.of(context).size.width / 3,
          height: MediaQuery.of(context).size.height * 0.7,
          decoration: BoxDecoration(
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
                      hintText: "Supplier name",
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
                      hintText: "Supplier phone",
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
                      hintText: "Supplier address",
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
                  onPressed: () {},
                  child: const Text('ADD SUPPLIER'),
                ),
              )
            ],
          )),
    );
  }
}
