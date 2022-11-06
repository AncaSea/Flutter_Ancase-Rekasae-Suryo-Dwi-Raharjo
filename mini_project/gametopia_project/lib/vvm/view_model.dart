import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/game_model.dart';
import '../models/gamebycategory_model.dart';
import '../models/gamedetail_model.dart';
import '../models/profile_model.dart';
import '../models/register_model.dart';
import '../service/api.dart';

enum ApiState { none, loading, error }

class GameStoreManager extends ChangeNotifier {
  ServiceAPI dioService = ServiceAPI();
  
  late SharedPreferences loginData;
  late GameDetailModel apiDetailGame;
  String? landing;
  
  ApiState apiState = ApiState.none;
  bool? isLogin;
  bool isCategory = false;
  
  List<Register> listregister = [];
  List<GameModel> listApiGames = [];
  List<GameDetailModel> listApiDetailGame = [];
  List<GameByCategoryModel> listApiGameByCategory = [];
  List<ProfileInfoItem> items = [];

  void setDataUser(String email, String password) async {
    try {
      apiState = ApiState.loading;
      print('stateProfile: $apiState');
      await Future.delayed(const Duration(seconds: 1), () {
        if (items.isEmpty) {
          items.add(ProfileInfoItem('Email', email));
          items.add(ProfileInfoItem('Password', password));
        }
      });
      apiState = ApiState.none;
      print('stateProfile: $apiState');
    } catch (e) {
      apiState = ApiState.error;
    }
    notifyListeners();
  }

  Future<void> addRegister(Register register, String user, String email, String pass) async {
    listregister.add(register);
    await updatePreferences(user, email, pass);
    print('provAddRegister: ${listregister[0].toString()}');
    print('provAddRegister: ${listregister.length}');
    notifyListeners();
  }

  Future<void> removeRegister() async {
    // listregister.clear();
    await removePreferences();
    notifyListeners();
  }

  Future<void> updatePreferences(String user, String email, String pass) async {
    loginData = await SharedPreferences.getInstance();

    await loginData.setString('username', user);
    await loginData.setString('email', email);
    await loginData.setString('password', pass);
    // await loginData.setBool('isLogin', !isLogin);

    print('provAddShared: ${loginData.getString('username')}');
    print('boolRemove1: ${loginData.getBool('remove')}');
    print('boolIsLogin1: ${loginData.getBool('isLogin')}');

    notifyListeners();
  }

  Future<void> removePreferences() async {
    loginData = await SharedPreferences.getInstance();
    await loginData.clear();
    // await loginData.setBool('isLogin', isLogin);

    print('provDelete: ${listregister.toString()}');
    print('boolRemove2: ${loginData.getBool('remove')}');
    print('boolIsLogin2: ${loginData.getBool('isLogin')}');

    notifyListeners();
  }

  void getAllGames() async {
    try {
      isCategory = false;
      apiState = ApiState.loading;
      debugPrint('stateAll: $apiState');
      final result = await dioService.getAllGamesApi();
      apiState = ApiState.none;
      debugPrint('stateAll: $apiState');
      listApiGames = result;
    } catch (e) {
      apiState = ApiState.error;
    }
    // debugPrint('list: $listApiGames');
    notifyListeners();
  }

  Future getDetailGame(int? id) async {
    try {
      apiState = ApiState.loading;
      debugPrint('state: $apiState');
      final result = await dioService.getDetailGamesApi(id);
      apiState = ApiState.none;
      debugPrint('state: $apiState');
      apiDetailGame = result;
    } catch (e) {
      apiState = ApiState.error;
      log(e.toString());
    }
    // debugPrint('list: $apiDetailGame');
    notifyListeners();
  }

  void getGameByCategory(String category) async {
    try {
      isCategory = true;
      apiState = ApiState.loading;
      debugPrint('stateCategory: $apiState');
      final result = await dioService.getGameByCategory(category);
      apiState = ApiState.none;
      debugPrint('stateCategory: $apiState');
      listApiGameByCategory = result;
    } catch (e) {
      apiState = ApiState.error;
    }
    // debugPrint('list: $listApiDetailGame');
    notifyListeners();
  }
  
  launchURL(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw 'Could not launch $url';
    }
  }
}