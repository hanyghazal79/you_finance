import 'package:firebase_database/firebase_database.dart';

class Person {
  String? key;
  String? name;
  String? phone;
  String? address;
  Person({required this.key, required this.name, required this.phone, required this.address});

  Person personFromMap(Map map) {
    return Person(
        key: map['key'], name: map['name'], phone: map['phone'], address: map['address']);
  }

  Map<String?, String?> toMap() {
    return {"key": key, "name": name, "phone": phone, "address": address};
  }
  Person.fromSnapshot(DataSnapshot snapshot){
    var map = snapshot.value! as Map;
    key = map['key'];
    name = map['name'];
    phone = map['phone'];
    address = map['address'];
  }
}
