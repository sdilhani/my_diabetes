import 'package:flutter/material.dart';
import 'package:my_diabetes/src/ui/widget/default_button.dart';
import 'package:my_diabetes/src/ui/widget/default_text_field.dart';

import '../../blocs/login_bloc_provider.dart';

class SignInForm extends StatefulWidget {
  @override
  SignInFormState createState() {
    return SignInFormState();
  }
}

class SignInFormState extends State<SignInForm> {
  LoginBloc _bloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _bloc = LoginBlocProvider.of(context);
  }

  @override
  void dispose() {
    _bloc.dispose();
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
                child: Column(
                  children: <Widget>[
                    Container(
                      // A fixed-height child
                      margin: EdgeInsets.only(top: 60.0, bottom: 16.0, left: 40.0, right: 40.0),
                      height: 200.0,
                      alignment: Alignment.center,
                      child: Image.asset("assets/images/logo.png",
                          fit: BoxFit.contain,
                          height: double.maxFinite,
                          width: double.maxFinite,
                          alignment: Alignment.center),
                    ),
                    Container(
                        // A fixed-height child.
                        height: 400.0,
                        alignment: Alignment.center,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              emailField(),
                              Container(
                                  margin:
                                      EdgeInsets.only(top: 5.0, bottom: 5.0)),
                              passwordField(),
                              Container(
                                  margin:
                                      EdgeInsets.only(top: 20.0, bottom: 20.0)),
                              submitButton()
                            ])),
                    Expanded(
                      // A flexible child that will grow to fit the viewport but
                      // still be at least as big as necessary to fit its contents.
                      child: Column( // Red
                        children: [
                          Expanded(flex: 1, child: forgotPasswordButton()),
                          Expanded(flex: 1, child: registerNavigationButton())
                        ]
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Container(
  //       height: double.infinity,
  //       width: double.infinity,
  //       child: LayoutBuilder(builder:
  //           (BuildContext context, BoxConstraints viewportConstraints) {
  //         return SingleChildScrollView(
  //             child: ConstrainedBox(
  //                 constraints: BoxConstraints(
  //                   minHeight: viewportConstraints.maxHeight,
  //                 ),
  //                 child: Column(
  //                   mainAxisAlignment: MainAxisAlignment.start,
  //                   children: <Widget>[
  //                     emailField(),
  //                     Container(margin: EdgeInsets.only(top: 5.0, bottom: 5.0)),
  //                     passwordField(),
  //                     Container(
  //                         margin: EdgeInsets.only(top: 20.0, bottom: 20.0)),
  //                     submitButton(),
  //                     Container(
  //                         margin: EdgeInsets.only(top: 15.0, bottom: 50.0)),
  //                     Expanded(flex: 1, child: forgotPasswordButton()),
  //                     Expanded(flex: 1, child: registerNavigationButton()),
  //                   ],
  //                 )));
  //       }));
  // }

  Widget passwordField() {
    return StreamBuilder(
        stream: _bloc.password,
        builder: (context, AsyncSnapshot<String> snapshot) {
          return DefaultTextField(
              "Enter the Password", _bloc.changePassword, true);
        });
  }

  Widget emailField() {
    return StreamBuilder(
        stream: _bloc.email,
        builder: (context, snapshot) {
          return DefaultTextField("Enter the Email", _bloc.changeEmail, false);
        });
  }

  Widget submitButton() {
    return StreamBuilder(
        stream: _bloc.signInStatus,
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (!snapshot.hasData || snapshot.hasError) {
            return button();
          } else {
            return CircularProgressIndicator();
          }
        });
  }

  Widget button() {
    return DefaultButton("Login", () {
      if (_bloc.validateFields()) {
        authenticateUser();
      } else {
        showErrorMessage();
      }
    });
  }

  Widget forgotPasswordButton() {
    return MaterialButton(
        onPressed: () {},
        child: Text("Forgot password?", style: TextStyle(color: Colors.black)));
  }

  Widget registerNavigationButton() {
    return MaterialButton(
        onPressed: () {},
        child: Text("Don't have an account? Register",
            style: TextStyle(color: Colors.red)));
  }

  void authenticateUser() {
    _bloc.showProgressBar(true);
    _bloc.submit().then((value) {
      if (value == 0) {
        //New User
        _bloc.registerUser().then((value) {
          // Navigator.pushReplacement(
          //context,
          // MaterialPageRoute(
          //   builder: (context) => GoalsList(_bloc.emailAddress)));
        });
      } else {
        _bloc.showProgressBar(false);
        //Already registered
        // Navigator.pushReplacement(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => GoalsList(_bloc.emailAddress)));
      }
    });
  }

  void showErrorMessage() {
    final snackbar =
        SnackBar(content: Text("Error"), duration: new Duration(seconds: 2));
    Scaffold.of(context).showSnackBar(snackbar);
  }
}
