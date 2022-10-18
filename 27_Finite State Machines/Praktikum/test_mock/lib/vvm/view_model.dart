import 'package:flutter/material.dart';
import 'package:test_mock/model/foods_model.dart';
import '../model/api/foods_api.dart';

class ViewModel with ChangeNotifier {
  List<Foods> foods = [];
  FoodsAPI foodAPI = FoodsAPI();

  void getAllFoods() async {
    final f = await foodAPI.getData();
    foods = f!;
    notifyListeners();
  }
}
