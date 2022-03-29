part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoadingLoginState extends LoginState {}

class SuccessLoginState extends LoginState {
  LoginModel? loginmodel;
  SuccessLoginState({this.loginmodel});
}

class ErrorLoginState extends LoginState {}
