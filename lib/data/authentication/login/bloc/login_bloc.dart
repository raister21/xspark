import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginUsernameChanged) {
      yield state.copywith(username: event.username);
    } else if (event is LoginPasswordChanged) {
      yield state.copywith(password: event.password);
    } else if (event is LoginSubmitted) {
      // TO DO: Repo bata tan
      print("Loading");
      yield LoginProcessing();

      try {
        print("try to login");
        await Future.delayed(Duration(seconds: 3));
        print("Success");
        yield LoginSuccess();
      } catch (e) {
        yield LoginState();
        print(e);
      }
    }
  }
}
