import 'dart:async';
import 'package:my_diabetes/src/models/models.dart';

import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class SettingsBloc {
  final _repository = Repository();
  final _isLoading = BehaviorSubject<bool>();

  Observable<bool> get loadingStatus => _isLoading.stream;

  Function(bool) get showProgressBar => _isLoading.sink.add;

  Stream<String> getUserName() {
     return _repository.getUserName().asStream();
  }

  Stream<String> getUserImage() {
     return _repository.getLoggedInUserImage().asStream();
  }

  void dispose() async {
    await _isLoading.drain();
    _isLoading.close();
  }
}