import 'package:firebase_database/firebase_database.dart';

class Person {
  String id;
  String name;
  String phone;
  String address;
  Person(
      {required this.id,
      required this.name,
      required this.phone,
      required this.address});

  Person personFromMap(Map map) {
    return Person(
        id: map['id'],
        name: map['name'],
        phone: map['phone'],
        address: map['address']);
  }
}
