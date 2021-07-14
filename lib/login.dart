import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State createState() => new LoginPageState();
}

class LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  var _adminName = "";
  var _adminEmail = "";
  TextEditingController _emailController = TextEditingController(text: "");
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      body: new Stack(fit: StackFit.expand, children: <Widget>[
        new Image(
          image: new AssetImage("assets/background.jpeg"),
          fit: BoxFit.cover,
          colorBlendMode: BlendMode.darken,
          color: Colors.black87,
        ),
        new Theme(
          data: new ThemeData(
              brightness: Brightness.dark,
              inputDecorationTheme: new InputDecorationTheme(
                // hintStyle: new TextStyle(color: Colors.blue, fontSize: 20.0),
                  labelStyle: new TextStyle(
                      color: Color.fromARGB(100, 224, 146, 252),
                      fontSize: 22.0),
                  focusColor: Color.fromARGB(100, 224, 146, 252))),
          // isMaterialAppTheme: true,
          child: Center(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                new Text(
                  "Welcome " +
                      (_adminName != "" ? _adminName + " " : "") +
                      "to Horizon Project Management System ",
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                      color: Color.fromARGB(100, 212, 56, 255),
                      fontWeight: FontWeight.bold),
                  textScaleFactor: 2,
                ),
                new Container(
                  padding: const EdgeInsets.all(40.0),
                  child: new Form(
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Visibility(
                          child: new TextFormField(
                            decoration: new InputDecoration(
                                labelText: "Enter Email",
                                fillColor: Colors.white),
                            keyboardType: TextInputType.emailAddress,
                            controller: _emailController,
                            autovalidateMode:
                            AutovalidateMode.onUserInteraction,
                          ),
                          visible: _adminEmail == "",
                        ),
                        new TextFormField(
                            decoration: new InputDecoration(
                              labelText: "Enter Password",
                            ),
                            obscureText: true,
                            keyboardType: TextInputType.text,
                          ),
                        new Padding(
                          padding: const EdgeInsets.only(top: 60.0),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
