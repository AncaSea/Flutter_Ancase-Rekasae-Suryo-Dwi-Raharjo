import 'package:dio/dio.dart';
import '../data_model.dart';

class DataAPI {
  static Future<List<Data>> getData() async {
    final response = await Dio().get(
        "https://mocki.io/v1/e0810bf6-646e-426a-8417-a28707f2e1a3");

    List<Data> contacts = (response.data as List)
        .map(
          (e) => Data(
            name: e['name'],
            gender: e['gender'],
            phone: e['phone'],
          ),
        )
        .toList();
    return contacts;
  }
}
