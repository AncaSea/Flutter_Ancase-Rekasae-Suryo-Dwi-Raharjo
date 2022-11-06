import 'package:flutter/material.dart';

class Register extends ChangeNotifier {
  String nama;
  String email;
  String password;

  Register(
    this.nama,
    this.email,
    this.password,
  );

  Map<String, dynamic> toJson() => {
        'nama': nama,
        'email': email,
        'password': password,
      };

  Register.fromJson(Map json)
      : nama = json['nama'],
        email = json['email'],
        password = json['password'];
}
