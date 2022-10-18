import 'package:test/test.dart';
import 'package:test_mock/model/api/foods_api.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:test_mock/model/foods_model.dart';

import 'food_api_test.mocks.dart';

@GenerateMocks([FoodsAPI])
void main() {
  FoodsAPI foodsAPI = FoodsAPI();

  group('FoodsAPI', () {
    foodsAPI = MockFoodsAPI();
    
    test('get all foods returns data', () async {
      when(foodsAPI.getData()).thenAnswer(
        (realInvocation) async => <Foods>[
          Foods()
        ]);
      final foods = await foodsAPI.getData();
      expect(foods?.isNotEmpty, true);
    });
  });
}