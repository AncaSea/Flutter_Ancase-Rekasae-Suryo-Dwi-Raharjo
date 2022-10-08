part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class Login extends AuthEvent {
  String username;
  String password;
  Login({required this.username, required this.password});
}
