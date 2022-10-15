part of 'storage_bloc.dart';

@immutable
abstract class StorageState extends Equatable {
  const StorageState();
  
  @override
  List<Object> get props => [];
}

class StorageInitial extends StorageState {}

class StorageLoading extends StorageState {}

// ignore: must_be_immutable
class StorageLoaded extends StorageState {
  List<Register> registers = [];

  StorageLoaded({required this.registers});

  @override
  List<Object> get props => [registers];
}

class StorageLogin extends StorageState {
  const StorageLogin();

  @override
  List<Object> get props => [];
}
