import 'dart:async';
import 'package:my_diabetes/src/models/models.dart';

import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class HospitalBloc {
  final _repository = Repository();
  final _isLoading = BehaviorSubject<bool>();

  Observable<bool> get loadingStatus => _isLoading.stream;

  Function(bool) get showProgressBar => _isLoading.sink.add;

  Stream<List<HospitalModel>> getHospitalsByIds(List<String> ids) {
     return _repository.getHospitalsByIds(ids);
  }

  void dispose() async {
    await _isLoading.drain();
    _isLoading.close();
  }
}