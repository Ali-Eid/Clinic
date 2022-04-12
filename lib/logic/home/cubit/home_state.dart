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

//address states

class SuccessChangevalueState extends HomeState {}

class SuccessLoadCities extends HomeState {}

class SuccessLoadDestrict extends HomeState {}

class ErrorLoadCities extends HomeState {}

//
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
class LoadingProductDetailsState extends HomeState {}

class SuccessProductDetailsState extends HomeState {
  // SubCategoryModel? submodel;
  ProductDetailsModel? itemdetails;
  SuccessProductDetailsState({this.itemdetails});
}

class ErrorProductDetailsState extends HomeState {}

//sub category product
class SuccessproductsSubCategory extends HomeState {}

class ErrorproductsSubCategory extends HomeState {}

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
class LoadingShowCartState extends HomeState {}

class SuccessShowCartState extends HomeState {}

class ErrorShowCartState extends HomeState {
  String? error;
  ErrorShowCartState({this.error});
}

//add quantity
class LoadingAddquantitytState extends HomeState {}

class SuccessAddquantitytState extends HomeState {}

class ErrorAddquantitytState extends HomeState {
  String? error;
  ErrorAddquantitytState({this.error});
}

//change quantity
class changequntatyAddState extends HomeState {}

class changequntatyMinesState extends HomeState {}

//sign out

class SuccessLogOutState extends HomeState {
  SuccessLogOutState();
}

class ErrorLogOutState extends HomeState {
  String? error;
  ErrorLogOutState({this.error});
}

//Last order
class SuccessLastOrderState extends HomeState {}

class ErrorLastOrderState extends HomeState {
  String? error;
  ErrorLastOrderState({this.error});
}

//search
class LoadingSearchProductState extends HomeState {
  LoadingSearchProductState();
}

class SuccessSearchProductState extends HomeState {
  SearchModel? search;
  SuccessSearchProductState({this.search});
}

class ErrorSearchProductState extends HomeState {
  String? error;
  ErrorSearchProductState({this.error});
}
