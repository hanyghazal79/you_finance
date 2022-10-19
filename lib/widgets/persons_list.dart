import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:you_finance/models/person.dart';
import 'package:you_finance/static_members/instances.dart';
import 'package:you_finance/viewmodels/person_view_model.dart';

class PersonsList extends StatefulWidget {
  final String type;
  const PersonsList({super.key, required this.type});

  @override
  State<StatefulWidget> createState() => _PersonsListState();
}

class _PersonsListState extends State<PersonsList> {
  late PersonViewModel _viewModel;
  late DatabaseReference _dbRef;
  List<Person?>? _personList;
  // late StreamSubscription<DatabaseEvent> onPersonAddedSubscription,
  //     onPersonUpdatedSubscription;
  Stream<DataSnapshot>? _stream;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _viewModel = Provider.of<PersonViewModel>(context, listen: false);
    _dbRef = (widget.type == 'Suppliers')
        ? Instances.suppliersReference
        : Instances.clientsReference;
    retrieveData();

    // onPersonAddedSubscription = _dbRef.onChildAdded.listen(onPersonAdded);
    // onPersonUpdatedSubscription = _dbRef.onChildChanged.listen(onPersonUpdated);
    // _dbRef.onValue.listen((event) {
    //   _personList!.add(Person.fromSnapshot(event.snapshot));
    // });
  }

  retrieveData() async {
    await _viewModel.retrieveAll(databaseReference: _dbRef);
    setState(() {
      _stream = _viewModel.streamController.stream;
      _stream!.forEach((element) {
        _personList!.add(Person.fromSnapshot(element));
      });
    });
  }
  // onPersonAdded(DatabaseEvent event) {
  //   setState(() {
  //     _personList?.add(Person.fromSnapshot(event.snapshot));
  //   });
  // }
  //
  // onPersonUpdated(DatabaseEvent event) {
  //   var old =
  //       _personList!.singleWhere((person) => person?.key == event.snapshot.key);
  //   setState(() {
  //     _personList![_personList!.indexOf(old)] =
  //         Person.fromSnapshot(event.snapshot);
  //   });
  // }
  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   super.dispose();
  //   onPersonAddedSubscription.cancel();
  //   onPersonUpdatedSubscription.cancel();
  //
  // }

  @override
  Widget build(BuildContext context) {
    return FirebaseAnimatedList(
        query: _dbRef,
        itemBuilder: (BuildContext context, DataSnapshot dataSnapshot,
            Animation<double> animation, int index) {
          Person person = Person.fromSnapshot(dataSnapshot);
          return ListTile(title: Text(person.name!),);
        });
  }
}
