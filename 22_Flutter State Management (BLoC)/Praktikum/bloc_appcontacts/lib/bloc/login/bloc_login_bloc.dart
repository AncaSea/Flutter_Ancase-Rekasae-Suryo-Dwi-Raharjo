import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';

part 'bloc_login_event.dart';
part 'bloc_login_state.dart';

class BlocLoginBloc extends Bloc<BlocLoginEvent, BlocLoginState> {
  BlocLoginBloc() : super(BlocLoginInitial()) {
    on<BlocLoginEvent>((event, emit) async {
      if (event is LoginNavBack) {
        emit(BlocLoginSubmitted());
      }
    });
  }
}
