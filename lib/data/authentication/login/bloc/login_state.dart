part of 'login_bloc.dart';

class LoginState extends Equatable {
  const LoginState({this.username, this.password});
  final String username;
  bool get isUsernameValid => (username != null) ? username.length > 4 : false;
  final String password;
  bool get isPasswordValid => (password != null) ? password.length > 6 : false;

  LoginState copywith({String username, String password}) {
    return LoginState(
        username: username ?? this.username,
        password: password ?? this.password);
  }

  @override
  List<Object> get props => [username, password];
}

class LoginProcessing extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginFailed extends LoginState {}
