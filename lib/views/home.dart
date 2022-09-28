import 'package:adaptive_navigation/adaptive_navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:you_finance/viewmodels/home_view_model.dart';
import 'package:you_finance/views/dashboard.dart';
import 'package:you_finance/views/suppliers.dart';
import 'package:you_finance/widgets/welcome.dart';

class Home extends StatefulWidget {
  Home({Key? key, required this.body}) : super(key: key);

  Widget body;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<AdaptiveScaffoldDestination> _destinations = [
    AdaptiveScaffoldDestination(title: 'Dashboard', icon: Icons.dashboard),
    AdaptiveScaffoldDestination(title: 'Suppliers', icon: Icons.business),
    AdaptiveScaffoldDestination(title: 'Clients', icon: Icons.people),
    AdaptiveScaffoldDestination(title: 'Settings', icon: Icons.settings),
  ];
  int _selectedIndex = -1;
  late HomeViewModel _homeViewModel;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _homeViewModel = Provider.of<HomeViewModel>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return AdaptiveNavigationScaffold(
      backgroundColor: const Color.fromRGBO(225, 225, 225, 1.0),
        body: widget.body, //_homeViewModel.widget,
        selectedIndex: _selectedIndex,
        destinations: _destinations,
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
          _homeViewModel.setHomeWidgetFromIndex(index: _selectedIndex);
          setState(() {
            widget.body = _homeViewModel.widget;
          });
        });
  }
}
