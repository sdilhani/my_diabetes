import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_diabetes/src/ui/widget/default_button.dart';
import 'package:my_diabetes/src/ui/widget/default_text_field.dart';

import '../../blocs/register_bloc_provider.dart';

class SignUpForm extends StatefulWidget {
  @override
  SignUpFormState createState() {
    return SignUpFormState();
  }
}

class SignUpFormState extends State<SignUpForm> {
  RegisterBloc _bloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _bloc = RegisterBlocProvider.of(context);
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //_bloc = RegisterBlocProvider.of(context);
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
                    Expanded(
                      // A flexible child that will grow to fit the viewport but
                      // still be at least as big as necessary to fit its contents.
                      child: Column(// Red
                          children: [
                        Container(
                            margin: EdgeInsets.only(top: 70.0, bottom: 5.0),
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Register for an Account",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ))),
                        Container(
                            margin: EdgeInsets.only(top: 30.0, bottom: 5.0),
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Welcome!",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ))),
                        Container(
                            margin: EdgeInsets.only(bottom: 5.0),
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "We just need to get a few details from you to get you signed up to this service.",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal),
                                ))),
                        Container(
                            margin: EdgeInsets.only(top: 20.0, bottom: 5.0)),
                        firstNameField(),
                        Container(
                            margin: EdgeInsets.only(top: 5.0, bottom: 5.0)),
                        lastNameField(),
                        Container(
                            margin: EdgeInsets.only(top: 5.0, bottom: 5.0)),
                        emailField(),
                        Container(
                            margin: EdgeInsets.only(top: 5.0, bottom: 5.0)),
                        phoneNumberField(),
                        Container(
                            margin: EdgeInsets.only(top: 5.0, bottom: 5.0)),
                        passwordField(),
                        Container(
                            margin: EdgeInsets.only(top: 5.0, bottom: 5.0)),
                        reEnterPasswordField(),
                        Container(
                            margin: EdgeInsets.only(top: 5.0, bottom: 35.0)),
                        submitButton(),
                      ]),
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

  Widget passwordField() {
    return StreamBuilder(
        stream: _bloc.password,
        builder: (context, AsyncSnapshot<String> snapshot) {
          return DefaultTextField(
              "Enter the Password", _bloc.changePassword, true, TextInputType.text);
        });
  }

  Widget reEnterPasswordField() {
    return StreamBuilder(
        stream: _bloc.rePassword,
        builder: (context, AsyncSnapshot<String> snapshot) {
          return DefaultTextField(
              "Re-Enter the Password", _bloc.changeRePassword, true, TextInputType.text);
        });
  }

  Widget emailField() {
    return StreamBuilder(
        stream: _bloc.email,
        builder: (context, AsyncSnapshot<String> snapshot) {
          return DefaultTextField("Enter the Email", _bloc.changeEmail, false, TextInputType.emailAddress);
        });
  }

  Widget firstNameField() {
    return StreamBuilder(
        stream: _bloc.firstName,
        builder: (context, AsyncSnapshot<String> snapshot) {
          return DefaultTextField("Enter the First Name", _bloc.changeFirstName, false, TextInputType.name);
        });
  }

  Widget lastNameField() {
    return StreamBuilder(
        stream: _bloc.lastName,
        builder: (context, AsyncSnapshot<String> snapshot) {
          return DefaultTextField("Enter the Last Name", _bloc.changeLastName, false, TextInputType.name);
        });
  }

  Widget phoneNumberField() {
    return StreamBuilder(
        stream: _bloc.phoneNumber,
        builder: (context, AsyncSnapshot<String> snapshot) {
          return DefaultTextField("Enter the Phone Number", _bloc.changePhone, false, TextInputType.phone);
        });
  }

  Widget submitButton() {
    return StreamBuilder(
        stream: _bloc.processStatus,
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
      if (!snapshot.hasData || snapshot.hasError) {
        return button();
      } else {
        print(snapshot.data);
        if(!snapshot.data) {
          if (Navigator.canPop(context)) {
            Navigator.pop(context);
          } else {
            SystemNavigator.pop();
          }
        }
        return CircularProgressIndicator();
      }
    });
  }

  Widget button() {
    return DefaultButton("Submit", () {
      String result = _bloc.validateFields();
      if (result == "") {
        _bloc.showProgressBar(true);
        _bloc.registerUser().then((value) => {
          _bloc.showProgressBar(false)
        });
      } else {
        showErrorMessage(result);
      }
    });
  }

  void showErrorMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }
}
