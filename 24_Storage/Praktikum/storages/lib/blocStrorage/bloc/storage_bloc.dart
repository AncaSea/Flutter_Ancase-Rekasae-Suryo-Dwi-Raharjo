import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:storages/providerStorage/Models/register.dart';
part 'storage_event.dart';
part 'storage_state.dart';

class StorageBloc extends Bloc<StorageEvent, StorageState> {
  StorageBloc() : super(StorageInitial()) {
    List<Register> listregister = [];

    late SharedPreferences loginData;

    on<AddRegister>((event, emit) {
      if (state is StorageLoaded) {
        // print('loaded');
        final state = this.state as StorageLoaded;
        listregister.add(event.register);
        emit(StorageLoaded(
          registers: List.from(state.registers)..add(event.register),
        ));
        // print(listregister.toList());
      }
    });

    on<RemoveRegister>((event, emit) {
      final state = this.state as StorageLoaded;
      listregister.remove(event.register);
      emit(StorageLoaded(
        registers: List.from(state.registers)..remove(event.register),
      ));
      // print(listregister);
    });

    on<UpdateShared>((event, emit) async {
        List<String> myRegister =
            listregister.map((e) => json.encode(e.toJson())).toList();

        loginData = await SharedPreferences.getInstance();

        await loginData.setStringList('listregister', myRegister);
        // print("sharedUpdate : ${loginData.getStringList('listregister')}");
    });

    on<RemoveShared>((event, emit) async {
      loginData = await SharedPreferences.getInstance();
      await loginData.remove('listregister');
      listregister.clear();
      // print("removeShared : ${loginData.getStringList('listregister')}");
    });

    on<Initial>((event, emit) async {
      await Future<void>.delayed(const Duration(seconds: 1));
      loginData = await SharedPreferences.getInstance();
      final list = loginData.getStringList('listregister') ?? [];
      listregister =
          list.map<Register>((e) => Register.fromJson(json.decode(e))).toList();
      // print('load: $listregister');
      emit(StorageLoaded(registers: listregister));
    });
  }
}
