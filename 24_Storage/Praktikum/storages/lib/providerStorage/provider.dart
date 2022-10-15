import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:storages/providerStorage/Models/register.dart';
// import 'package:storages/providerStorage/home_provider.dart';

class ListRegister extends ChangeNotifier {
  List<Register> listregister = [];

  late SharedPreferences loginData;

  void addShared(Register register) {
    listregister.add(register);
    updatePreferences();
    notifyListeners();
  }

  void removeShared(Register register) {
    listregister.remove(register);
    removePreferences();
    notifyListeners();
  }

  Future<void> updatePreferences() async {
    List<String> myRegister =
        listregister.map((e) => json.encode(e.toJson())).toList();

    loginData = await SharedPreferences.getInstance();

    await loginData.setStringList('listregister', myRegister);

    // for (Register element in listregister) {
    //   _list.addAll([element.nama, element.email, element.telepon, element.password].toList());
    // }
    // print(loginData.getStringList('listregister'));
  }

  Future<void> removePreferences() async {
    loginData = await SharedPreferences.getInstance();
    await loginData.remove('listregister');
    listregister.clear();

    print(loginData.getStringList('listregister'));
  }

  Future<void> initial() async {
    loginData = await SharedPreferences.getInstance();
    final list = loginData.getStringList('listregister') ?? [];
    listregister =
        list.map<Register>((e) => Register.fromJson(json.decode(e))).toList();
    notifyListeners();
  }
  // late Register registerData = Register('nama', 'email', 'telepon', 'password');
      // Register? registerData;

  // late bool isLogin;

  // List<Register> get list => listregister; 
  // ListRegister() {
  //   initialState();
  // }

  // void initialState() {
  //   syncDataWithProvider();
  // }

  // Future<void> checkLogin(BuildContext context) async {
  //   loginData = await SharedPreferences.getInstance();
  //   trumin = loginData.getBool('isLogin') ?? true;
  //   if (trumin == false) {
  //     // ignore: use_build_context_synchronously
  //     Navigator.pushAndRemoveUntil(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => RegisterProviderHome(dataRegister: registerData,),
  //         ),
  //         (route) => false);
  //   }
  //   notifyListeners();
  // }

  

  // Future<void> syncDataWithProvider() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   final result = prefs.getStringList('listregister');
    

    // if (result != null) {
    //   listregister =
    //       result.map((e) => Register.fromJson(json.decode(e))).toList();
    //   // print(listregister);
    // }
    // notifyListeners();
  // }
}
