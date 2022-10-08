// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'bloc_login_bloc.dart';

@immutable
abstract class BlocLoginEvent{
  const BlocLoginEvent();
}

class LoginNavBack extends BlocLoginEvent {}

// class LoginSuccess extends BlocLoginEvent {}

// class LoginFailed extends BlocLoginEvent {
//   List<Object> get props => [];
// }