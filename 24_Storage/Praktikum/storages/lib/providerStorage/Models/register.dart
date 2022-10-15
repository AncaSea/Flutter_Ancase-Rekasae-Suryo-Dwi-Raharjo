import 'package:flutter/material.dart';

class Register extends ChangeNotifier {
  String nama;
  String email;
  String telepon;
  String password;
  bool isLogin;
  
  Register(
    this.nama,
    this.email,
    this.telepon,
    this.password,
    this.isLogin,
  );

  Map<String, dynamic> toJson() => {
    'nama': nama,
    'email': email,
    'telepon': telepon,
    'password': password,
    'isLogin': isLogin,
  };

  Register.fromJson(Map json) :
    nama = json['nama'],
    email = json['nama'],
    telepon = json['nama'],
    password = json['password'],
    isLogin = json['isLogin'];
}