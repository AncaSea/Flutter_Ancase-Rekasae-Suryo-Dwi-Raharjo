part of 'bloc_login_bloc.dart';

abstract class BlocLoginState {
  BlocLoginState();
}

class BlocLoginInitial extends BlocLoginState {}

class BlocLoginLoading extends BlocLoginState {}

class BlocLoginSubmitted extends BlocLoginState {}

