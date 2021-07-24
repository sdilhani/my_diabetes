import 'package:flutter/material.dart';
import 'hospital_bloc.dart';

class HospitalBlocProvider extends InheritedWidget{
  final bloc = HospitalBloc();

  HospitalBlocProvider({Key key, Widget child}) : super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static HospitalBloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<HospitalBlocProvider>()).bloc;
  }
}