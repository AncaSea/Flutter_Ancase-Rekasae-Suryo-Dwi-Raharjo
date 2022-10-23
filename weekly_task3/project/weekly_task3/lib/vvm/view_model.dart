import 'package:flutter/material.dart';

import '../database/database.dart';
import '../models/user_model.dart';


class BusManager extends ChangeNotifier {
  List<DataUser> _dataUsers = [];
  bool isUpdate = false;
  late DatabaseHelper _dbHelper;
  List<DataUser> get dataUsers => _dataUsers;

  BusManager() {
    _dbHelper = DatabaseHelper();
    _getAll();
  }

  void _getAll() async {
    _dataUsers = await _dbHelper.getDataUsers();
    notifyListeners();
  }

  Future<void> add(DataUser dataUser) async {
    await _dbHelper.insertDataUser(dataUser);
    _getAll();
  }

  // Future<DataUser> getById(String id) async {
  //   return await _dbHelper.getDataUserById(id);
  // }

  void update(DataUser dataUser) async {
    await _dbHelper.updateDataUser(dataUser);
    _getAll();
  }

  void delete(String id) async {
    await _dbHelper.deleteDataUser(id);
    _getAll();
  }

  void isUpdateState() {
    isUpdate = !isUpdate;
    // print(isUpdate);
  }
}