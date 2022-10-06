import 'package:bloc_appcontacts/models/contact_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'contact_event.dart';
part 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  ContactBloc() : super(ContactInitial()) {
    on<InitializeContactEvent>((event, emit) async {
      await Future<void>.delayed(const Duration(seconds: 1));
      emit(ContactLoaded(itemContacts: 
        []
      ));
    });

    on<AddContact>((event, emit) {
      final state = this.state as ContactLoaded;
      final list = state.itemContacts;
      list.add(event.listContact);
      emit(ContactLoaded(itemContacts: list));
    });
    
    on<DeleteContact>((event, emit) {
      final state = this.state as ContactLoaded;
      final list = state.itemContacts;
      list.remove(event.listContact);
      emit(ContactLoaded(itemContacts: list));
    });
  }
}
