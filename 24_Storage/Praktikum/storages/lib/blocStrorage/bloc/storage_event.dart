part of 'storage_bloc.dart';

@immutable
abstract class StorageEvent extends Equatable {
  const StorageEvent();

  @override
  List<Object> get props => [];
}

class Initial extends StorageEvent {}

class LoadRegisterData extends StorageEvent {}

class AddRegister extends StorageEvent { 
  late Register register;

  AddRegister(this.register);

  @override
  List<Object> get props => [register];
}

// ignore: must_be_immutable
class RemoveRegister extends StorageEvent {
  late Register register;

  RemoveRegister(this.register);

  @override
  List<Object> get props => [register];
}

class UpdateShared extends StorageEvent {}

class RemoveShared extends StorageEvent {}

// ignore: must_be_immutable
class CheckUser extends StorageEvent {
  BuildContext context;
  Register register;

  CheckUser(
    this.context,
    this.register,
  );

  @override
  List<Object> get props => [register];
}