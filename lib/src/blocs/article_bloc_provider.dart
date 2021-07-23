import 'package:flutter/material.dart';
import 'article_bloc.dart';

class ArticleBlocProvider extends InheritedWidget{
  final bloc = ArticleBloc();

  ArticleBlocProvider({Key key, Widget child}) : super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static ArticleBloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<ArticleBlocProvider>()).bloc;
  }
}