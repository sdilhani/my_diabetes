import 'package:flutter/material.dart';
import 'package:my_diabetes/src/blocs/logout_bloc.dart';

class LogoutBlocProvider extends InheritedWidget{
  final bloc = LogoutBloc();

  LogoutBlocProvider({Key key, Widget child}) : super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static LogoutBloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<LogoutBlocProvider>()).bloc;
  }
}