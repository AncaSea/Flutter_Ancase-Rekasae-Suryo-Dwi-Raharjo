import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../models/user.dart';
import '../models/user_get.dart';

class ActionMethodAPI {
  final Dio dio = Dio();
  Map<String, dynamic> listapi = {};
  
  Future getUsers() async {
    try {
      final Response response = await dio.get('https://reqres.in/api/users%27');
      final UserModelGet userget = UserModelGet.fromJson(response.data);
      debugPrint('Dari API : ${response.data.toString()}');
      debugPrint('Dari Model : ${(userget.toMap()).toString()}');
      return userget.toMap();
      // return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future postUser({
    required String name,
    required String job,
  }) async {
    try {
      final Response response = await dio.post(
        'https://reqres.in/api/users',
        data: {
          'name': name,
          'job': job,
        },
      );
      final UserModel usermodel = UserModel.fromJson(response.data);
      debugPrint(response.data.toString());
      return usermodel.toMap();
    } catch (e) {
      rethrow;
    }
  }

  Future putUser({
    required String name,
    required String job,
  }) async {
    try {
      final Response response = await dio.put(
        'https://reqres.in/api/users/4',
        data: {
          'name': name,
          'job': job,
        },
      );
      final UserModel usermodel = UserModel.fromJson(response.data);
      debugPrint(response.data.toString());
      return usermodel.toMap();
    } catch (e) {
      rethrow;
    }
  }

  Future deleteUser() async {
    try {
      final Response response = await dio.delete(
        'https://reqres.in/api/users/4',
      );
      debugPrint(response.data.toString());
    } catch (e) {
      rethrow;
    }
  }
}