import 'package:flutter/material.dart';
import 'article_bloc.dart';
import 'doctor_bloc.dart';

class DoctorBlocProvider extends InheritedWidget{
  final bloc = DoctorBloc();

  DoctorBlocProvider({Key key, Widget child}) : super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static DoctorBloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<DoctorBlocProvider>()).bloc;
  }
}