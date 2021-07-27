import 'dart:async';
import 'package:my_diabetes/src/models/models.dart';

import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class AppointmentBloc {
  final _repository = Repository();

  Stream<String> getUserName() {
     return _repository.getUserName().asStream();
  }

  Stream<String> getUserImage() {
     return _repository.getLoggedInUserImage().asStream();
  }
}