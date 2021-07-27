import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_diabetes/src/resources/repository.dart';
import 'package:my_diabetes/src/ui/homeScreen.dart';
import 'package:my_diabetes/src/ui/login.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _repository = Repository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: new Image.asset(
        "assets/images/splash.png",
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.bottomRight,
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 3), () {
      _repository.isLoggedIn().then((value) => {
            if (value != null && value){
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => HomeScreen()))
            } else {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => LoginScreen()))
            }
          });
    });
  }
}
