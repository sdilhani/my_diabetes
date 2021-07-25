import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPopup extends StatelessWidget {
  ForgotPasswordPopup();

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
                          Text('FORGOT PASSWORD',
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
                          Text('We have e-mailed your password reset link!',
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
                              onPressed: () => Navigator.pop(context),
                              child: Text("Ok",
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
        )
    );
  }
}
