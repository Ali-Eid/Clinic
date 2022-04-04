part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class LoadingGetServiceState extends HomeState {}

class SuccessGetServiceState extends HomeState {}

class ErrorGetServiceState extends HomeState {
  String? error;
  ErrorGetServiceState({this.error});
}

class LoadingCategoriesState extends HomeState {}

class SuccessCategoriesState extends HomeState {
  MedicalSupplies? medical;
  SuccessCategoriesState({this.medical});
}

class ErrorCategoriesState extends HomeState {}

//sub category
class SuccessSubCategoriesState extends HomeState {
  SubCategoryModel? submodel;
  SuccessSubCategoriesState({this.submodel});
}

class ErrorSubCategoriesState extends HomeState {}

//prouduct_Details
class SuccessProductDetailsState extends HomeState {
  SubCategoryModel? submodel;
  SuccessProductDetailsState({this.submodel});
}

class ErrorProductDetailsState extends HomeState {}

//UserInfo
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

//Order Clinic
class LoadingRequestCleanClinicState extends HomeState {}

class SuccessRequestCleanClinicState extends HomeState {
  OrderModel? ordermedical;
  SuccessRequestCleanClinicState({this.ordermedical});
}

class ErrorRequestCleanClinicState extends HomeState {
  String? error;
  ErrorRequestCleanClinicState({this.error});
}

//Add To Cart
class SuccessAddToCartState extends HomeState {}

class ErrorAddToCartState extends HomeState {
  String? error;
  ErrorAddToCartState({this.error});
}

//Show Cart
class SuccessShowCartState extends HomeState {}

class ErrorShowCartState extends HomeState {
  String? error;
  ErrorShowCartState({this.error});
}
