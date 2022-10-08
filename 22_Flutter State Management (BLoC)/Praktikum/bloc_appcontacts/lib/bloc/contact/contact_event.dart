part of 'contact_bloc.dart';

abstract class ContactEvent{
  const ContactEvent();

  List<Contact> get props => [];
}

class InitializeContactEvent extends ContactEvent {}

// ignore: must_be_immutable
class AddContact extends ContactEvent {
  Contact listContact;
  
  AddContact(this.listContact);
}

// ignore: must_be_immutable
class DeleteContact extends ContactEvent {
  Contact listContact;
  
  DeleteContact(this.listContact);
}