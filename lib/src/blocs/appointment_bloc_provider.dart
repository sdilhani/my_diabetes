import 'package:flutter/material.dart';
import 'package:my_diabetes/src/blocs/appointment_bloc.dart';
import 'package:my_diabetes/src/blocs/settings_bloc.dart';
import 'food_bloc.dart';
import 'hospital_bloc.dart';

class AppointmentBlocProvider extends InheritedWidget{
  final bloc = AppointmentBloc();

  AppointmentBlocProvider({Key key, Widget child}) : super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static AppointmentBloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<AppointmentBlocProvider>()).bloc;
  }
}