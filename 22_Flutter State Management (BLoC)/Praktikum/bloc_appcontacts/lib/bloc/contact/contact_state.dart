// ignore_for_file: must_be_immutable

part of 'contact_bloc.dart';

abstract class ContactState {
  List<Contact> get props => [];
}

class ContactInitial extends ContactState {}

class ContactLoaded extends ContactState{
  List<Contact> itemContacts = [];
  ContactLoaded({required this.itemContacts});
}

// class ContactFail extends ContactState {
//   String error;

//   ContactFail({required this.error});

//   @override
//   String toString() => 'LoginFailure { error: $error }';
// }
