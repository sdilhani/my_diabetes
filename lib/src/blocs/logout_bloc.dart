import 'dart:async';
import 'package:my_diabetes/src/models/models.dart';

import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class LogoutBloc {
  final _repository = Repository();

  Future<void> logoutUser() {
     return _repository.logoutUser();
  }
}