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

class SuccessLoadSpecialist extends HomeState {}

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
class Loadingupdateinfo extends HomeState {}

class SuccessUserInfoState extends HomeState {
  // OrderModel? ordermedical;
  SuccessUserInfoState();
}

class SuccessUpdateUserInfoState extends HomeState {
  // OrderModel? ordermedical;
  SuccessUpdateUserInfoState();
}

class ErrorUserInfoState extends HomeState {
  String? error;
  ErrorUserInfoState({this.error});
}

// upload photo
class SuccessChangeProfileImageState extends HomeState {
  SuccessChangeProfileImageState();
}

class ErrorChangeProfileImageState extends HomeState {
  ErrorChangeProfileImageState();
}

//get profile photo
class LoadingProfileImageState extends HomeState {}

class SuccessProfileImageState extends HomeState {}

class ErrorProfileImageState extends HomeState {
  String? error;
  ErrorProfileImageState({this.error});
}

////////////////////
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

class SuccessLogOutState extends HomeState {}

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
class LoadingSearchProductState extends HomeState {}

class SuccessSearchProductState extends HomeState {
  SearchModel? search;
  SuccessSearchProductState({this.search});
}

class ErrorSearchProductState extends HomeState {
  String? error;
  ErrorSearchProductState({this.error});
}

//Lates_news
class LoadingLatestNewsState extends HomeState {}

class SuccessLatestNewsState extends HomeState {
  LatestNewsModel? latestNewsModel;
  SuccessLatestNewsState({this.latestNewsModel});
}

class ErrorLatestNewsState extends HomeState {
  String? error;
  ErrorLatestNewsState({this.error});
}

//About Us
class SuccessAboutUsState extends HomeState {
  String? body;
  SuccessAboutUsState({this.body});
}

class ErrorAboutUsState extends HomeState {
  String? error;
  ErrorAboutUsState({this.error});
}

//Notifications
class LoadingNotificationsState extends HomeState {}

class SuccessNotificationsState extends HomeState {}

class ErrorNotificationsState extends HomeState {
  String? error;
  ErrorNotificationsState({this.error});
}
