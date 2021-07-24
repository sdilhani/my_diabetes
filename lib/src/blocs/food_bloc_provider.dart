import 'package:flutter/material.dart';
import 'food_bloc.dart';
import 'hospital_bloc.dart';

class FoodBlocProvider extends InheritedWidget{
  final bloc = FoodBloc();

  FoodBlocProvider({Key key, Widget child}) : super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static FoodBloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<FoodBlocProvider>()).bloc;
  }
}