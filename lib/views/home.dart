import 'package:adaptive_navigation/adaptive_navigation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:you_finance/static_members/instances.dart';
import 'package:you_finance/viewmodels/home_view_model.dart';

class Home extends StatefulWidget {
  Home({Key? key, required this.body}) : super(key: key);

  Widget body;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<AdaptiveScaffoldDestination> _destinations = [
    const AdaptiveScaffoldDestination(title: 'Dashboard', icon: Icons.dashboard),
    const AdaptiveScaffoldDestination(title: 'Suppliers', icon: Icons.business),
    const AdaptiveScaffoldDestination(title: 'Clients', icon: Icons.people),
    const AdaptiveScaffoldDestination(title: 'Settings', icon: Icons.settings),
  ];
  int _selectedIndex = 0;
  late HomeViewModel _homeViewModel;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _homeViewModel = Provider.of<HomeViewModel>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(builder: (context, _homeViewModel, child){
      return AdaptiveNavigationScaffold(
          backgroundColor: const Color.fromRGBO(225, 225, 225, 1.0),
          body: widget.body, //_homeViewModel.widget,
          selectedIndex: _selectedIndex,
          destinations: _destinations,
          onDestinationSelected: (index) {
            if (Instances.user == null) {
              return;
            } else {
              setState(() {
                _selectedIndex = index;
              });
              _homeViewModel.setHomeWidgetFromIndex(index: _selectedIndex);
              setState(() {
                widget.body = Consumer<HomeViewModel>(builder: (context, _homeViewModel, child){
                  return _homeViewModel.widget;
                },);//_homeViewModel.widget;
              });
            }
          });
    });
  }
}
