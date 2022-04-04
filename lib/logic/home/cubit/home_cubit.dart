import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:clinic/constants.dart';
import 'package:clinic/end_points.dart';
import 'package:clinic/model/cart/show_cart.dart';
import 'package:clinic/model/contact_info.dart';
import 'package:clinic/model/login_model.dart';
import 'package:clinic/model/medical_supplies.dart';
import 'package:clinic/model/order_model.dart';
import 'package:clinic/model/product_model.dart';
import 'package:clinic/model/service_list_model.dart';
import 'package:clinic/model/service_model.dart';
import 'package:clinic/model/sub_category_model.dart';
import 'package:clinic/model/user_model.dart';
import 'package:clinic/services/cach_helper.dart';
import 'package:clinic/services/network/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);

  MedicalSupplies? medicalModel;
  List<String> img = [
    'assets/images/Asset 24.png',
    'assets/images/Asset 25.png',
    'assets/images/Asset 24.png',
    'assets/images/Asset 524.png',
    'assets/images/Asset 88.png',
  ];

  void getCategories() async {
    emit(LoadingCategoriesState());
    try {
      http.Response response = await http
          .get(Uri.parse('${url}medical-supplies/categories'), headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${CacheHelper.getData(key: 'token')}',
        'Accept': 'application/json',
        'Accept-Language': 'en'
      });

      print(response.body);
      medicalModel = MedicalSupplies.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
      emit(SuccessCategoriesState(medical: medicalModel));
    } catch (e) {
      print(e.toString());
      emit(ErrorCategoriesState());
    }
  }

  SubCategoryModel? subModel;
  void getsubCategory(int id) async {
    emit(LoadingCategoriesState());
    try {
      http.Response response = await http.get(
          Uri.parse('${url}medical-supplies/categories/${id}/subcategories'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ${CacheHelper.getData(key: 'token')}',
            'Accept': 'application/json',
            'Accept-Language': 'en'
          });
      print(response.body);
      subModel = SubCategoryModel.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
      emit(SuccessSubCategoriesState(submodel: subModel));
    } catch (e) {
      emit(ErrorSubCategoriesState());
    }
  }

  ProductModel? productModel;

  void getproductDetails({int? id}) async {
    emit(LoadingCategoriesState());
    try {
      http.Response response = await http.get(
          Uri.parse('${url}medical-supplies/categories/${id}/products'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ${CacheHelper.getData(key: 'token')}',
            'Accept': 'application/json',
            'Accept-Language': 'en'
          });
      print(response.body);
      productModel = ProductModel.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
      emit(SuccessProductDetailsState());
    } catch (e) {
      print(e.toString());
      emit(ErrorProductDetailsState());
    }
  }

  UserModel? model;
  ContactInfoModel? contactInfoModel;
  void meInfo() {
    var data =
        DioHelper.getData(url: ME, token: CacheHelper.getData(key: 'token'))
            .then((value) {
      model = UserModel.fromJson(value.data);
      print(value.data);
      print('city_id : ${model!.data!.address!.cityId}');
      print('district_id : ${model!.data!.address!.districtId}');
      print('details : ${model!.data!.address!.id}');
      //contact_method
      emit(SuccessUserInfoState());
    }).catchError((error) {
      emit(ErrorUserInfoState());
    });
  }

  void getContactinfo() async {
    http.Response response = await http.get(Uri.parse('${url}contact-infos'));
    contactInfoModel = ContactInfoModel.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>);
    emit(SuccessUserInfoState());
  }

  // ServiceModel? servicemodel;
  // List<DataServiceList> main = [];
  // ServiceListModel? servicelistmodel;
  // List<DataServiceList> other = [];
  // void getService() async {
  //   try {
  //     http.Response response = await http.get(
  //       Uri.parse('${url}/services'),
  //       headers: {
  //         'Content-Type': 'application/json',
  //         'Authorization': 'Bearer ${token}',
  //         'Accept': 'application/json',
  //         'Accept-Language': 'en'
  //       },
  //     );
  //     servicemodel = ServiceModel.fromJson(
  //         jsonDecode(response.body) as Map<String, dynamic>);
  //     servicelistmodel!.data!.forEach((element) {
  //       if (element.isMain!) {
  //         main.add(element);
  //       } else {
  //         other.add(element);
  //       }
  //     });
  //     print(response.body);
  //     emit(SuccessGetServiceState());
  //   } catch (e) {
  //     print(e.toString());
  //     emit(ErrorGetServiceState(error: e.toString()));
  //   }
  // }

  OrderModel? oredermodel;

  void requestmaintenance({
    required String moblilenum,
    required String serialnum,
    required String device,
    required String type,
    required String description,
    required String details,
  }) async {
    emit(LoadingRequestMaintenanceState());
    try {
      http.Response response = await http.post(
        Uri.parse('https://my-clinic22.herokuapp.com/api/orders'),
        body: jsonEncode({
          'mobile_number': moblilenum,
          'address': {
            'city_id': '${model!.data!.address!.cityId}',
            'district_id': '${model!.data!.address!.districtId}',
            'details': details,
          },
          'type': 'maintenance',
          'details': {
            'serial_number': serialnum,
            'style': type,
            'type': device,
            'description': description
          },
        }),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${CacheHelper.getData(key: 'token')}',
          'Accept': 'application/json',
          'Accept-Language': 'en'
        },
      );
      print('${response.body}');
      var data = jsonDecode(response.body) as Map<String, dynamic>;
      oredermodel = OrderModel.fromJson(data);
      if (!(oredermodel!.status!)) {
        print(oredermodel!.message);

        if (oredermodel!.data!.mobileNumber is List<dynamic>) {
          emit(ErrorRequestMaintenanceState(
              error: oredermodel!.data!.mobileNumber.toString()));
        } else {
          emit(ErrorRequestMaintenanceState(error: oredermodel!.message));
        }
      } else {
        emit(SuccessRequestMaintenanceState(ordermedical: oredermodel));
      }
    } catch (e) {
      print('State error');
      print(e.toString());
      emit(ErrorRequestMaintenanceState(error: e.toString()));
    }
  }

  void requestcleanclinic({
    required String moblilenum,
    required String description,
    required String details,
    required String type,
  }) async {
    emit(LoadingRequestMaintenanceState());
    try {
      http.Response response = await http.post(
        Uri.parse('https://my-clinic22.herokuapp.com/api/orders'),
        body: jsonEncode({
          'mobile_number': moblilenum,
          'address': {
            'city_id': '${model!.data!.address!.cityId}',
            'district_id': '${model!.data!.address!.districtId}',
            'details': details,
          },
          'type': type,
          'details': {'description': description},
        }),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${CacheHelper.getData(key: 'token')}',
          'Accept': 'application/json',
          'Accept-Language': 'en'
        },
      );
      print('${response.body}');
      var data = jsonDecode(response.body) as Map<String, dynamic>;
      oredermodel = OrderModel.fromJson(data);
      if (!(oredermodel!.status!)) {
        print(oredermodel!.message);

        if (oredermodel!.data!.mobileNumber is List<dynamic>) {
          emit(ErrorRequestCleanClinicState(
              error: oredermodel!.data!.mobileNumber.toString()));
        } else {
          emit(ErrorRequestCleanClinicState(error: oredermodel!.message));
        }
      } else {
        emit(SuccessRequestCleanClinicState(ordermedical: oredermodel));
      }
    } catch (e) {
      print('State error');
      print(e.toString());
      emit(ErrorRequestCleanClinicState(error: e.toString()));
    }
  }

  ServiceModel? servicemodel;
  void servicedetails({int? id}) async {
    emit(LoadingGetServiceState());
    try {
      http.Response response =
          await http.get(Uri.parse('${url}services/${id}'), headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${CacheHelper.getData(key: 'token')}',
        'Accept': 'application/json',
        'Accept-Language': 'en'
      });

      print(response.body);
      // if (response.statusCode == 200) {
      servicemodel = ServiceModel.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
      emit(SuccessGetServiceState());
      // }
    } catch (e) {
      emit(ErrorGetServiceState(error: 'Data is Not found in Server '));
    }
  }

  void addtocart({int? id}) async {
    try {
      http.Response response =
          await http.post(Uri.parse('${url}cart'), headers: {
        // 'Content-Type': 'application/json',
        'Authorization': 'Bearer ${CacheHelper.getData(key: 'token')}',
        'Accept': 'application/json',
        'Accept-Language': 'en'
      }, body: {
        'product_ids[0]': id.toString()
      });
      print('add to cart Response is :${response.body}');
      getcart();
      emit(SuccessAddToCartState());
    } catch (e) {
      print(e.toString());
      emit(ErrorAddToCartState(error: e.toString()));
    }
  }

  ShowCartModel? showCartModel;
  void getcart() async {
    try {
      http.Response response =
          await http.get(Uri.parse('${url}cart'), headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${CacheHelper.getData(key: 'token')}',
        'Accept': 'application/json',
        'Accept-Language': 'en'
      });
      print('response get cart ${response.body}');
      showCartModel = ShowCartModel.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
      emit(SuccessShowCartState());
    } catch (e) {
      print(e.toString());
      emit(ErrorShowCartState());
    }
  }
}
