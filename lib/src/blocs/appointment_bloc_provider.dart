import 'package:flutter/material.dart';
import 'package:my_diabetes/src/blocs/settings_bloc.dart';
import 'food_bloc.dart';
import 'hospital_bloc.dart';

class SettingsBlocProvider extends InheritedWidget{
  final bloc = SettingsBloc();

  SettingsBlocProvider({Key key, Widget child}) : super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static SettingsBloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<SettingsBlocProvider>()).bloc;
  }
}