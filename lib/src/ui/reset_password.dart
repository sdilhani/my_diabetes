import 'package:flutter/material.dart';
import 'package:my_diabetes/src/ui/widget/forgot_password_form_data.dart';

class ResetPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(color: Colors.white),
            alignment: Alignment(0.0, 0.0),
            child: ForgotPasswordForm()));
  }
}
