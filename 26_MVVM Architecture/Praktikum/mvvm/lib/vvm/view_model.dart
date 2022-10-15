import 'package:flutter/material.dart';
import '../model/api/contact_api.dart';
import '../model/api/data_api.dart';
import '../model/contact_model.dart';
import '../model/data_model.dart';

class ViewModel with ChangeNotifier {
  List<Contact> contacts = [];
  List<Contact> get listcontacts => contacts;
  List<Data> profile = [];
  List<Data> get listprofile => profile;

  getAllContacts() async {
    final c = await ContactAPI.getContact();
    contacts = c;
    notifyListeners();
  }

  getAllProfile() async {
    final p = await DataAPI.getData();
    profile = p;
    notifyListeners();
  }
}
