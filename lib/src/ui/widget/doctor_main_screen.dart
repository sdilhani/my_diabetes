import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_diabetes/src/blocs/article_bloc_provider.dart';
import 'package:my_diabetes/src/blocs/doctor_bloc_provider.dart';
import 'package:my_diabetes/src/ui/widget/articles_list.dart';
import 'package:my_diabetes/src/ui/widget/consultant_list.dart';
import 'package:my_diabetes/src/ui/widget/doctor_list.dart';

class DoctorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(child: DoctorMainScreen()));
  }
}

class DoctorMainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DoctorMainScreenState();
  }
}

class _DoctorMainScreenState extends State<DoctorMainScreen> with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  TabController _controller;
  final List<String> _titles = ["Doctor", "Consultant"];

  @override
  Widget build(BuildContext context) {
    final List<Widget> _children = [
      DoctorBlocProvider(child: DoctorListScreen()),
      DoctorBlocProvider(child: ConsultantListScreen()),
    ];

    return Scaffold(
      appBar: new AppBar(
          backgroundColor: Color.fromRGBO(172, 8, 8, 0.9),
          title: new TabBar(tabs: <Tab>[
            new Tab(child: Text(_titles[0], style: TextStyle(color: Colors.white, fontSize: 16),)),
            new Tab(child: Text(_titles[1], style: TextStyle(color: Colors.white, fontSize: 16),))
          ], controller: _controller , indicatorColor: Colors.white,)),
      body: _children[_currentIndex],
    );
  }

  @override
  void initState() {
    super.initState();
    // Create TabController for getting the index of current tab
    _controller = TabController(length: _titles.length, vsync: this);

    _controller.addListener(() {
      setState(() {
        onTabTapped(_controller.index);
      });
      print("Selected Index: " + _controller.index.toString());
    });
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}

class PlaceholderWidget extends StatelessWidget {
  final Color color;

  PlaceholderWidget(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
    );
  }
}
