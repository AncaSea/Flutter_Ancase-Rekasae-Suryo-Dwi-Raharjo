import 'dart:developer';
import 'package:dio/dio.dart';
import '../models/game_model.dart';
import '../models/gamebycategory_model.dart';
import '../models/gamedetail_model.dart';

const apiKey = '66d83598e55d46a0986c0bbc8e1d4bf1';
const rapidApiKey = 'baa6b03797mshfc7334b2f7039b8p1815e8jsnfa4d834e86c8';
const rapidApiHost = 'free-to-play-games-database.p.rapidapi.com';

class ServiceAPI {

  final dio = Dio(BaseOptions(
    baseUrl: "https://free-to-play-games-database.p.rapidapi.com/api",
  ));

  ServiceAPI() {
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        options.headers['X-RapidAPI-Key'] = rapidApiKey;
        options.headers['X-RapidAPI-Host'] = rapidApiHost;
        return handler.next(options);
      },
    ));
    dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
  }

  Future<List<GameModel>> getAllGamesApi() async {
    try {
      final response = await dio.get('/games');
      // debugPrint('$response');
      List<GameModel> result = List<GameModel>.from(
          response.data.map((p) => GameModel.fromJson(p)));
      return result;
    } catch (e) {
      throw 'Error: $e';
    }
  }

  Future<GameDetailModel> getDetailGamesApi(int? id) async {
    try {
      final response = await dio.get('/game', queryParameters: {'id':id});
      // print(response.data);
      final gameDetailModel = GameDetailModel.fromJson(response.data);
      // debugPrint(gameDetailModel.toString());
      return gameDetailModel;
    } catch (e) {
      log('detail: $e');
      throw 'Error: $e';
    }
  }

  Future<List<GameByCategoryModel>> getGameByCategory(String category) async {
    try {
      final response =
          await dio.get('/games', queryParameters: {'category': category});
      // debugPrint('${response.data}');
      List<GameByCategoryModel> result = List<GameByCategoryModel>.from(
          response.data.map((p) => GameByCategoryModel.fromJson(p)));
      // debugPrint('${response.data}');
      return result;
    } catch (e) {
      throw 'Error: $e';
    }
  }
}

