import 'package:dio/dio.dart';
import '../foods_model.dart';

class FoodsAPI {
  final Dio dio = Dio();

  Future<List<Foods>?> getData() async {
    try {
      final Response response = await dio
          .get('https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/foods');
      final  result = (response.data as List).map((e) => Foods.fromJson(e)).toList();
      return result;
    } catch (e) {
      rethrow;
    }
  }
}
