import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_diabetes/src/blocs/logout_bloc.dart';
import 'package:my_diabetes/src/blocs/logout_bloc_provider.dart';

import '../login.dart';

class LogoutPopUp extends StatefulWidget {
  LogoutPopUp();

  @override
  _LogoutPopUpState createState() {
    return _LogoutPopUpState();
  }
}

class _LogoutPopUpState extends State<LogoutPopUp> {
  LogoutBloc _bloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _bloc = LogoutBlocProvider.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        contentPadding: EdgeInsets.zero,
        content: Container(
          height: 170,
          child: Column(
            children: <Widget>[
              Container(
                  height: 50,
                  color: Color.fromRGBO(172, 8, 8, 0.9),
                  child: Padding(
                      padding: EdgeInsets.all(0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('SIGN OUT',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14)),
                        ],
                      ))),
              Container(
                  height: 60,
                  color: Colors.white,
                  child: Padding(
                      padding: EdgeInsets.all(0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Are you sure you want sign out?',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 12)),
                        ],
                      ))),
              Container(
                  height: 60,
                  color: Colors.white,
                  child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                              onPressed: () => {
                                    _bloc.logoutUser().then((value) => {
                                          Navigator.pop(context),
                                          Navigator.of(context).pushReplacement(
                                              MaterialPageRoute(
                                                  builder: (_) =>
                                                      LoginScreen()))
                                        })
                                  },
                              child: Text("YES",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14)),
                              style: ElevatedButton.styleFrom(
                                primary: Color.fromRGBO(
                                    172, 8, 8, 0.9), // This is what you need!
                              )),
                          TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text("No",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14)),
                              style: ElevatedButton.styleFrom(
                                primary: Color.fromRGBO(
                                    172, 8, 8, 0.9), // This is what you need!
                              )),
                        ],
                      )))
            ],
          ),
        ));
  }
}
