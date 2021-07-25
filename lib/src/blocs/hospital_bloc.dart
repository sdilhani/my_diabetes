import 'dart:async';
import 'package:my_diabetes/src/models/models.dart';

import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class HospitalBloc {
  final _repository = Repository();

  Stream<List<HospitalModel>> getHospitalsByIds(List<String> ids) {
    print(" ids $ids.length");
     return _repository.getHospitalsByIds(ids);
  }
}