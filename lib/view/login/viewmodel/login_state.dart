part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {
  LoginState(){}
}

class LoginLoadingState extends LoginState{

}

class LoginCompleteState extends LoginState{
  final LoginResponse response;

  LoginCompleteState(this.response);

}

class LoginFailedState extends LoginState{
  final String message;

  LoginFailedState(this.message);
}