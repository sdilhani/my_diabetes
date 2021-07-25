import 'package:flutter/material.dart';
import 'package:my_diabetes/src/blocs/reset_password_bloc.dart';
import 'package:my_diabetes/src/blocs/reset_password_bloc_provider.dart';
import 'package:my_diabetes/src/ui/widget/default_button.dart';
import 'package:my_diabetes/src/ui/widget/default_text_field.dart';

class ResetPasswordForm extends StatefulWidget {
  @override
  ResetPasswordFormState createState() {
    return ResetPasswordFormState();
  }
}

class ResetPasswordFormState extends State<ResetPasswordForm> {
  ResetPasswordBloc _bloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _bloc = ResetPasswordBlocProvider.of(context);
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
                          margin: EdgeInsets.only(top: 70.0, bottom: 70.0),
                          child: Align(
                            alignment: Alignment.center,
                            child: userImage()
                          )),
                      Container(
                          margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                        child: oldPasswordField(),
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                        child: passwordField(),
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                        child: reEnterPasswordField(),
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 30.0, bottom: 30.0),
                        child: button(),
                      )
                    ]),
                  )));
        },
      ),
    );
  }

  Widget userImage() {
    return StreamBuilder(
        stream: _bloc.getUserImage(),
        initialData: null,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data != null && snapshot.data.toString() != "N/A") {
              return Image.network(snapshot.data.toString(),
                  fit: BoxFit.cover, height: 100, width: 100);
            } else {
              return Image.asset("assets/images/avatar.png",
                  color: Colors.red,
                  fit: BoxFit.cover, height: 100, width: 100);
            }
          } else {
            return CircularProgressIndicator();
          }
        });
  }

  Widget passwordField() {
    return StreamBuilder(
        stream: _bloc.password,
        builder: (context, AsyncSnapshot<String> snapshot) {
          return DefaultTextField(
              "Enter the New Password", _bloc.changePassword, true, TextInputType.text);
        });
  }

  Widget oldPasswordField() {
    return StreamBuilder(
        stream: _bloc.password,
        builder: (context, AsyncSnapshot<String> snapshot) {
          return DefaultTextField(
              "Enter the Old Password", _bloc.changeOldPassword, true, TextInputType.text);
        });
  }

  Widget reEnterPasswordField() {
    return StreamBuilder(
        stream: _bloc.rePassword,
        builder: (context, AsyncSnapshot<String> snapshot) {
          return DefaultTextField(
              "Re-Enter the New Password", _bloc.changeRePassword, true, TextInputType.text);
        });
  }

  Widget button() {
    return DefaultButton("Submit", () {
      String result = _bloc.validateFields();
      if (result.toString() == "") {
        _bloc.updatePassword().then((value) => {
          print("al - $value"),
          showMessage(value)
        });
      } else {
        showMessage(result);
      }
    });
  }

  void showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message), duration: Duration(seconds: 5)));
  }
}
