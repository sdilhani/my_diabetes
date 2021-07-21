import 'package:flutter/material.dart';
import 'package:my_diabetes/src/ui/register.dart';
import 'package:my_diabetes/src/ui/widget/default_button.dart';
import 'package:my_diabetes/src/ui/widget/default_text_field.dart';

class ForgotPasswordForm extends StatefulWidget {
  @override
  ForgotPasswordFormState createState() {
    return ForgotPasswordFormState();
  }
}

class ForgotPasswordFormState extends State<ForgotPasswordForm> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: Theme.of(context).textTheme.bodyText2,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
              child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: viewportConstraints.maxHeight,
                  ),
                  child: IntrinsicHeight(
                    child: Column(children: <Widget>[
                      Container(
                          margin: EdgeInsets.only(top: 70.0, bottom: 5.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Forgot Your Password?",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          )),
                      Container(
                          margin: EdgeInsets.only(top: 10.0, bottom: 5.0),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Enter your email and we’ll e-mail you a link to change your password.",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.normal),
                              ))),
                      Container(
                          margin: EdgeInsets.only(top: 80.0, bottom: 10.0),
                        child: emailField(),
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 10.0, bottom: 30.0),
                        child: button(),
                      )
                    ]),
                  )));
        },
      ),
    );
  }

  Widget emailField() {
    return StreamBuilder(builder: (context, snapshot) {
      return DefaultTextField("Enter your Email", (_) {}, false, TextInputType.emailAddress);
    });
  }

  Widget button() {
    return DefaultButton("Submit", () {});
  }

  Widget registerNavigationButton() {
    return MaterialButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => RegisterScreen()));
        },
        child: Text("Don't have an account? Register",
            style: TextStyle(color: Colors.red)));
  }

  void showErrorMessage() {
    final snackbar =
        SnackBar(content: Text("Error"), duration: new Duration(seconds: 2));
    Scaffold.of(context).showSnackBar(snackbar);
  }
}
