import 'dart:async';
import 'dart:html';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

import '../models/person.dart';
import '../static_members/strings.dart';

class PersonsList extends StatefulWidget{
  final String type;
  final ChangeNotifier changeNotifier;
  const PersonsList({super.key, required this.type, required this.changeNotifier});

  @override
  State<StatefulWidget> createState() => _PersonsListState();


}

class _PersonsListState extends State<PersonsList>{
  late DatabaseReference _dbRef;
  List<Person?>? _personList;
  late StreamSubscription<DatabaseEvent> onPersonAddedSubscription, onPersonUpdatedSubscription;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _dbRef = FirebaseDatabase.instance.ref().child(Strings.path);
    onPersonAddedSubscription = _dbRef.onChildAdded.listen(onPersonAdded);
    onPersonUpdatedSubscription = _dbRef.onChildChanged.listen(onPersonUpdated);

  }
  onPersonAdded(DatabaseEvent event){
    setState(() {
      _personList?.add(Person.fromSnapshot(event.snapshot));
    });
  }
  onPersonUpdated(DatabaseEvent event){
    var old = _personList!.singleWhere((person) => person?.key == event.snapshot.key);
    setState(() {
      _personList![_personList!.indexOf(old)] = Person.fromSnapshot(event.snapshot);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(child: ListView.builder(itemBuilder: (context, index){return null}),);
  }
}

