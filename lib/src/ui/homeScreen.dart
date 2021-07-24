import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_diabetes/src/blocs/article_bloc_provider.dart';
import 'package:my_diabetes/src/blocs/doctor_bloc_provider.dart';
import 'package:my_diabetes/src/blocs/food_bloc_provider.dart';
import 'package:my_diabetes/src/ui/widget/articles_list.dart';
import 'package:my_diabetes/src/ui/widget/consultant_list.dart';
import 'package:my_diabetes/src/ui/widget/doctor_list.dart';
import 'package:my_diabetes/src/ui/widget/doctor_main_screen.dart';
import 'package:my_diabetes/src/ui/widget/food_list.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Home()));
  }
}

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> _children = [
      ArticleBlocProvider( child: ArticlesListScreen()),
      DoctorScreen(),
      FoodBlocProvider( child: FoodListScreen()),
      PlaceholderWidget(Colors.yellow)
    ];

    final List<String> _titles = [
      "Read Article",
      "Doctor",
      "Food",
      "Setting"
    ];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromRGBO(172, 8, 8, 0.9),
        title: Text(_titles[_currentIndex], textAlign: TextAlign.center, style: TextStyle(color: Colors.white))
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped, // new
        currentIndex: _currentIndex, // new // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.menu_book_sharp),
              backgroundColor: Color.fromRGBO(95, 183, 148, 0.9),
            label: 'Articles'
          ),
          BottomNavigationBarItem(
            backgroundColor: Color.fromRGBO(95, 183, 148, 0.9),
            icon: new Icon(Icons.person_outline),
            label: 'Doctors',
          ),
          BottomNavigationBarItem(
              backgroundColor: Color.fromRGBO(95, 183, 148, 0.9),
              icon: Icon(Icons.food_bank_outlined),
              label: 'Food'
          ),
          BottomNavigationBarItem(
              backgroundColor: Color.fromRGBO(95, 183, 148, 0.9),
              icon: Icon(Icons.settings),
              label: 'Settings'
          )
        ],
      ),
    );
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
