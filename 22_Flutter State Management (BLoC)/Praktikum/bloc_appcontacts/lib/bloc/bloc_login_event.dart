part of 'bloc_login_bloc.dart';

@immutable
abstract class BlocLoginEvent extends Equatable {
  const BlocLoginEvent();

  @override
  List<Object> get props => [];
}

class LoginUsernameChanged extends BlocLoginEvent {
  final String username;
  const LoginUsernameChanged(this.username);

  @override
  List<Object> get props => [username];
}

class LoginPasswordChanged extends BlocLoginEvent {
  final String password;
  const LoginPasswordChanged(this.password);

  @override
  List<Object> get props => [password];
}

class LoginSubmitted extends BlocLoginEvent {}

class LoginSuccess extends BlocLoginEvent {}

class LoginFailed extends BlocLoginEvent {
  @override
  List<Object> get props => [];
}