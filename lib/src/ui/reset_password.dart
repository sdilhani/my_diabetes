import 'package:flutter/material.dart';
import 'package:my_diabetes/src/ui/widget/reset_password_form_data.dart';

class ResetPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromRGBO(172, 8, 8, 0.9),
        title: Text("Change Password",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white))),
        body: Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(color: Colors.white),
            alignment: Alignment(0.0, 0.0),
            child: ResetPasswordForm()));
  }
}
