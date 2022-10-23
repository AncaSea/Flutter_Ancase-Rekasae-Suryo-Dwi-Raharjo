import 'package:flutter/material.dart';

class DataUser extends ChangeNotifier {
  late String id;
  late String firstName;
  late String lastName;
  late String email;
  late String message;
  DataUser(
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.message,
  );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'message': message,
    };
  }

  DataUser.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    firstName = map['firstName'];
    lastName = map['lastName'];
    email = map['email'];
    message = map['message'];
  }
}