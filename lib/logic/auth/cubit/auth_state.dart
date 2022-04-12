part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class SignUpInitial extends AuthState {}

class ChangeVisibilityPasswordState extends AuthState {}

class SuccessLoadCities extends AuthState {}

class SuccessLoadDestrict extends AuthState {}

class SuccessLoadSpecialist extends AuthState {}

class ErrorLoadCities extends AuthState {}

class SuccessChangevalueState extends AuthState {}

//Sign up
class LoadingAuthState extends AuthState {}

class SuccessAuthState extends AuthState {
  AuthModel? model;
  SuccessAuthState({this.model});
}

class ErrorInputAuthState extends AuthState {
  SignUpErrorModel? errormodel;
  ErrorInputAuthState({this.errormodel});
}

class ErrorAuthState extends AuthState {
  String? error;
  ErrorAuthState({this.error});
}

class LoadingLoginState extends AuthState {}

class SuccessLoginState extends AuthState {
  AuthModel? loginmodel;
  SuccessLoginState({this.loginmodel});
}

class ErrorLoginState extends AuthState {
  String? error;
  ErrorLoginState({this.error});
}

class SuccessLogOutState extends AuthState {
  AuthModel? loginmodel;
  SuccessLogOutState({this.loginmodel});
}

class ErrorLogOutState extends AuthState {
  String? error;
  ErrorLogOutState({this.error});
}
