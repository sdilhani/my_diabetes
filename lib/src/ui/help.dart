import 'package:flutter/material.dart';

class Help extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: Color.fromRGBO(172, 8, 8, 0.9),
            title: Text("Help", textAlign: TextAlign.center, style: TextStyle(color: Colors.white))
        ),
        body: Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(color: Colors.white),
            alignment: Alignment(0.0, 0.0),
            child: Column(
                //
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.alternate_email_rounded,
                              color: Color.fromRGBO(172, 8, 8, 0.9)),
                          Container(
                            margin: EdgeInsets.all(10),
                          ),
                          Text('sdilhani866@gmail.com',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18)),
                        ],
                      )),
                  Padding(
                      padding: EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.local_phone_outlined,
                              color: Color.fromRGBO(172, 8, 8, 0.9)),
                          Container(
                            margin: EdgeInsets.all(10),
                          ),
                          Text('0776584891',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18)),
                        ],
                      ))
                ])));
  }
}
