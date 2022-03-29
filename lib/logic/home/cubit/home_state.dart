part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class LoadingCategoriesState extends HomeState {}

class SuccessCategoriesState extends HomeState {
  MedicalSupplies? medical;
  SuccessCategoriesState({this.medical});
}

class ErrorCategoriesState extends HomeState {}

class SuccessUserInfoState extends HomeState {
  // OrderModel? ordermedical;
  SuccessUserInfoState();
}

class ErrorUserInfoState extends HomeState {}

class LoadingRequestMaintenanceState extends HomeState {}

class SuccessRequestMaintenanceState extends HomeState {
  OrderModel? ordermedical;
  SuccessRequestMaintenanceState({this.ordermedical});
}

class ErrorRequestMaintenanceState extends HomeState {
  String? error;
  ErrorRequestMaintenanceState({this.error});
}
