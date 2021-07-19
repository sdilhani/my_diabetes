import 'package:flutter/material.dart';
import 'package:my_diabetes/src/ui/widget/sign_in_form_data.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(color: Colors.white),
            alignment: Alignment(0.0, 0.0),
            child: SignInForm()));
  }
}
