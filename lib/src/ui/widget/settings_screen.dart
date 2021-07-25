import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_diabetes/src/blocs/logout_bloc_provider.dart';
import 'package:my_diabetes/src/blocs/reset_password_bloc_provider.dart';
import 'package:my_diabetes/src/blocs/settings_bloc.dart';
import 'package:my_diabetes/src/blocs/settings_bloc_provider.dart';
import 'package:my_diabetes/src/ui/about_us.dart';
import 'package:my_diabetes/src/ui/help.dart';
import 'package:my_diabetes/src/ui/reset_password.dart';
import 'package:my_diabetes/src/ui/widget/logout_dialog.dart';

import '../forgot_password.dart';

class SettingsScreen extends StatefulWidget {
  @override
  SettingScreenState createState() {
    return SettingScreenState();
  }
}

class SettingScreenState extends State<SettingsScreen> {
  SettingsBloc _bloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _bloc = SettingsBlocProvider.of(context);
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
                      height: 250.0,
                      color: Color.fromRGBO(172, 8, 8, 0.9),
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.all(20),
                          ),
                          Container(child: userImage(), height: 100,),
                          Container(
                            margin: EdgeInsets.all(20),
                          ),
                Container(child: userNameText(),height: 50, )
                        ],
                      ),
                    ),
                    Expanded(
                      // A flexible child that will grow to fit the viewport but
                      // still be at least as big as necessary to fit its contents.
                      child: Column(
                          //
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.all(10),
                            ),
                            SizedBox(
                                child: TextButton(
                                  child: Padding(
                                      padding: EdgeInsets.all(16),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text('Change Password',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18)),
                                        ],
                                      )),
                                  onPressed: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (_) => ResetPasswordBlocProvider(child: ResetPasswordScreen()))),
                                ),
                                height: 80),

                            SizedBox(
                                child: TextButton(
                                  child: Padding(
                                      padding: EdgeInsets.all(16),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text('Help',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18)),
                                        ],
                                      )),
                                  onPressed: () => Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (_) => Help())),
                                ),
                                height: 80),

                            SizedBox(
                                child: TextButton(
                                  child: Padding(
                                      padding: EdgeInsets.all(16),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text('About Us',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18)),
                                        ],
                                      )),
                                  onPressed: () => Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (_) => AboutUs())),
                                ),
                                height: 80),

                            SizedBox(
                                child: TextButton(
                                  child: Padding(
                                      padding: EdgeInsets.all(16),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text('Signing Out',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18)),
                                        ],
                                      )),
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return LogoutBlocProvider(
                                            child: LogoutPopUp(),
                                          );
                                        });
                                  },
                                ),
                                height: 80),
                            // Expanded(flex: 1, child: registerNavigationButton())
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

  Widget userNameText() {
    return StreamBuilder(
        stream: _bloc.getUserName(),
        initialData: null,
        builder: (context, AsyncSnapshot<String> snapshot) {
          if(snapshot.hasData) {
            return Text(snapshot.data,
                style: TextStyle(color: Colors.white, fontSize: 21));
          } else {
            return CircularProgressIndicator();
          }
        });
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
                  fit: BoxFit.cover, height: 100, width: 100);
            }
          } else {
            return CircularProgressIndicator();
          }
        });
  }

  void showErrorMessage(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}
