import 'dart:async';
import 'package:my_diabetes/src/models/models.dart';

import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class FoodBloc {
  final _repository = Repository();
  final _isLoading = BehaviorSubject<bool>();
  final _selectedFood = BehaviorSubject<List<FoodModel>>();

  Observable<bool> get loadingStatus => _isLoading.stream;

  Observable<double> get sugars => _selectedFood.stream.transform(_calculateSugar);

  Function(bool) get showProgressBar => _isLoading.sink.add;

  Function(List<FoodModel>) get changeSelectedFood => _selectedFood.sink.add;

  final _calculateSugar =
  StreamTransformer<List<FoodModel>, double>.fromHandlers(handleData: (selectedFoods, sink) {
    double totalSugar = 0;

    selectedFoods.forEach((element) {
      totalSugar += double.parse(element.sugarContent);
    });

    sink.add(totalSugar);
  });

  Stream<List<FoodModel>> getAllFood() {
     return _repository.getAllFood();
  }

  void dispose() async {
    await _isLoading.drain();
    _isLoading.close();
    await _selectedFood.drain();
    _selectedFood.close();
  }
}