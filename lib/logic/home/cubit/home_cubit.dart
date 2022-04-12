import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:clinic/constants.dart';
import 'package:clinic/end_points.dart';
import 'package:clinic/model/cart/add_to_cart_model.dart';
import 'package:clinic/model/cart/show_cart.dart';
import 'package:clinic/model/cities_model.dart';
import 'package:clinic/model/contact_info.dart';
import 'package:clinic/model/district_model.dart';
import 'package:clinic/model/last_order_model.dart';
import 'package:clinic/model/login_model.dart';
import 'package:clinic/model/medical_supplies.dart';
import 'package:clinic/model/order_model.dart';
import 'package:clinic/model/product_datails_model.dart';
import 'package:clinic/model/product_model.dart';
import 'package:clinic/model/search/search_model.dart';
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
        'Accept-Language': '${CacheHelper.getData(key: 'lang')}'
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
            'Accept-Language': '${CacheHelper.getData(key: 'lang')}'
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
            'Accept-Language': '${CacheHelper.getData(key: 'lang')}'
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

  void getproductsSubCategory({int? id}) async {
    emit(LoadingCategoriesState());
    try {
      http.Response response = await http.get(
          Uri.parse('${url}medical-supplies/categories/${id}/products'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ${CacheHelper.getData(key: 'token')}',
            'Accept': 'application/json',
            'Accept-Language': '${CacheHelper.getData(key: 'lang')}'
          });
      print(response.body);
      productModel = ProductModel.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
      emit(SuccessproductsSubCategory());
    } catch (e) {
      print(e.toString());
      emit(ErrorproductsSubCategory());
    }
  }

  ProductDetailsModel? itemdetails;
  void getproductdetails({int? id}) async {
    try {
      emit(LoadingProductDetailsState());
      http.Response response = await http
          .get(Uri.parse('${url}medical-supplies/products/${id}'), headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${CacheHelper.getData(key: 'token')}',
        'Accept': 'application/json',
        'Accept-Language': '${CacheHelper.getData(key: 'lang')}'
      });
      print(response.body);
      if (response.statusCode == 200) {
        itemdetails = ProductDetailsModel.fromJson(
            jsonDecode(response.body) as Map<String, dynamic>);
        emit(SuccessProductDetailsState());
      }
    } catch (e) {
      print(e.toString());
      emit(ErrorProductDetailsState());
    }
  }

  UserModel? model;
  ContactInfoModel? contactInfoModel;
  void meInfo() async {
    try {
      http.Response response =
          await http.get(Uri.parse('${url}users/me'), headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${CacheHelper.getData(key: 'token')}',
        'Accept': 'application/json',
        'Accept-Language': '${CacheHelper.getData(key: 'lang')}'
      });
      print(response.body);
      if (response.statusCode == 200) {
        model = UserModel.fromJson(
            jsonDecode(response.body) as Map<String, dynamic>);
        print('city_id : ${model!.data!.address!.cityId}');
        print('district_id : ${model!.data!.address!.districtId}');
        print('details : ${model!.data!.address!.id}');
        //contact_method
        emit(SuccessUserInfoState());
      }
    } catch (e) {
      print('error user info ${e.toString()}');
      emit(ErrorUserInfoState());
    }
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
  CitiesModel? citiesModel;
  void getCities() async {
    disrictModel = null;
    valueDropDowndistrict = null;
    try {
      http.Response response =
          await http.get(Uri.parse('${url}cities'), headers: {
        'Content-Type': 'application/json',
        // 'Authorization': 'Bearer ${token}',
        'Accept': 'application/json',
        'Accept-Language': '${CacheHelper.getData(key: 'lang')}'
      });
      print(response.body);
      citiesModel = CitiesModel.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
      disrictModel = null;
      emit(SuccessLoadCities());
    } catch (e) {
      emit(ErrorLoadCities());
    }
  }

  DisrtictModel? disrictModel;
  void getDistrict({int? id}) async {
    disrictModel = null;
    valueDropDowndistrict = null;
    try {
      http.Response response =
          await http.get(Uri.parse('${url}cities/${id}/districts'), headers: {
        'Content-Type': 'application/json',
        // 'Authorization': 'Bearer ${token}',
        'Accept': 'application/json',
        'Accept-Language': '${CacheHelper.getData(key: 'lang')}'
      });
      print('disrict : ${response.body}');
      disrictModel = DisrtictModel.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);

      emit(SuccessLoadDestrict());
    } catch (e) {
      emit(ErrorLoadCities());
    }
  }

  String? valueDropDowncity;
  void changevalueDropdown(String val) {
    valueDropDowncity = val;
    emit(SuccessChangevalueState());
  }

  String? valueDropDowndistrict;
  void changevalueDropdownDistrict(String val) {
    valueDropDowndistrict = val;
    emit(SuccessChangevalueState());
  }

  OrderModel? oredermodel;

  void requestmaintenance({
    required String moblilenum,
    required String serialnum,
    required int city,
    required int destrict,
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
            'city_id': '${city}',
            'district_id': '${destrict}',
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
          'Accept-Language': '${CacheHelper.getData(key: 'lang')}'
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
        disrictModel = null;
        valueDropDowndistrict = null;
        valueDropDowncity = null;

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
    String? description,
    required String details,
    required String type,
    required int city,
    required int district,
  }) async {
    emit(LoadingRequestMaintenanceState());
    try {
      http.Response response = await http.post(
        Uri.parse('https://my-clinic22.herokuapp.com/api/orders'),
        body: jsonEncode({
          'mobile_number': moblilenum,
          'address': {
            'city_id': '${city}',
            'district_id': '${district}',
            'details': details,
          },
          'type': type,
          'details': {'description': description},
        }),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${CacheHelper.getData(key: 'token')}',
          'Accept': 'application/json',
          'Accept-Language': '${CacheHelper.getData(key: 'lang')}'
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
        disrictModel = null;
        valueDropDowndistrict = null;
        valueDropDowncity = null;
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
        // 'Content-Type': 'application/json',
        'Authorization': 'Bearer ${CacheHelper.getData(key: 'token')}',
        'Accept': 'application/json',
        'Accept-Language': '${CacheHelper.getData(key: 'lang')}'
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

  CartAddModel? cartAddModel;
  // List<DataProduct> cart_item = [];
  void addtocart({int? id}) async {
    try {
      cart.add(id!);
      if (!cart.contains(id)) {
        emit(SuccessAddToCartState());
      }
      http.Response response =
          await http.post(Uri.parse('${url}cart'), headers: {
        // 'Content-Type': 'application/json',
        'Authorization': 'Bearer ${CacheHelper.getData(key: 'token')}',
        'Accept': 'application/json',
        'Accept-Language': '${CacheHelper.getData(key: 'lang')}'
      }, body: {
        'product_ids[0]': id.toString()
      });
      print(response.body);
      if (response.statusCode == 200) {
        // print(response.body);
        cartAddModel = CartAddModel.fromJson(
            jsonDecode(response.body) as Map<String, dynamic>);
        if (cartAddModel!.data!.attached!.isEmpty) {
          cart.remove(id);
        }
      }
      getcart();
      // emit(SuccessAddToCartState());
    } catch (e) {
      print(e.toString());
      emit(ErrorAddToCartState(error: e.toString()));
    }
  }

  // void addtocart2({int? id}) async {
  //   try {
  //     print('cart 1 ${cart}');
  //     cart.add(id!);
  //     if (cart.length < 2) {
  //       emit(SuccessAddToCartState());
  //     }
  //     print('cart add 1 ${cart}');
  //     http.Response response =
  //         await http.post(Uri.parse('${url}cart'), headers: {
  //       // 'Content-Type': 'application/json',
  //       'Authorization': 'Bearer ${CacheHelper.getData(key: 'token')}',
  //       'Accept': 'application/json',
  //       'Accept-Language': 'en'
  //     }, body: {
  //       'product_ids[0]': id.toString()
  //     });
  //     print(response.body);
  //     if (response.statusCode == 200) {
  //       // print(response.body);
  //       print('cart add 3 before del ${cart}');
  //       cartAddModel = CartAddModel.fromJson(
  //           jsonDecode(response.body) as Map<String, dynamic>);
  //       if (cartAddModel!.data!.attached!.isEmpty) {
  //         cart.remove(id);
  //         print('cart add 3 after del ${cart}');
  //       }
  //     }

  //     //
  //     //   print('add to cart Response is :${response.body}');
  //     //   // getcart();
  //     //
  //     getcart();
  //     emit(SuccessAddToCartState());
  //   } catch (e) {
  //     print(e.toString());
  //     emit(ErrorAddToCartState(error: e.toString()));
  //   }
  // }

  ShowCartModel? showCartModel;

  void getcart() async {
    emit(LoadingShowCartState());

    try {
      http.Response response =
          await http.get(Uri.parse('${url}cart'), headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${CacheHelper.getData(key: 'token')}',
        'Accept': 'application/json',
        'Accept-Language': '${CacheHelper.getData(key: 'lang')}'
      });
      print('response get cart ${response.body}');
      showCartModel = ShowCartModel.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
      // showCartModel!.data!.cart!.forEach((element) {
      //   cart_item.add(element);
      // });
      // print('cart List cart ${cart_item}');
      cart = [];
      listcartbuild();
      emit(SuccessShowCartState());
    } catch (e) {
      print(e.toString());
      emit(ErrorShowCartState());
    }
  }

  void getcart2() async {
    // emit(LoadingShowCartState());

    try {
      http.Response response =
          await http.get(Uri.parse('${url}cart'), headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${CacheHelper.getData(key: 'token')}',
        'Accept': 'application/json',
        'Accept-Language': '${CacheHelper.getData(key: 'lang')}'
      });
      print('response get cart ${response.body}');
      showCartModel = ShowCartModel.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
      // showCartModel!.data!.cart!.forEach((element) {
      //   cart_item.add(element);
      // });
      // print('cart List cart ${cart_item}');
      cart = [];
      listcartbuild();
      emit(SuccessShowCartState());
      // yield showCartModel!;
    } catch (e) {
      print(e.toString());
      emit(ErrorShowCartState());
    }
  }

  List<int> cart = [];
  void listcartbuild() {
    showCartModel!.data!.cart!.forEach((element) {
      cart.add(element.cartProduct!.id!);
    });
  }

  ShowCartModel? cartquantity;
  void updatequantity({int? id, dynamic? quantity}) async {
    emit(LoadingAddquantitytState());
    try {
      http.Response response =
          await http.put(Uri.parse('${url}cart/${id}'), body: {
        'quantity': quantity
      }, headers: {
        // 'Content-Type': 'application/json',
        'Authorization': 'Bearer ${CacheHelper.getData(key: 'token')}',
        'Accept': 'application/json',
        'Accept-Language': '${CacheHelper.getData(key: 'lang')}'
      });
      if (response.statusCode == 200) {
        print('response update quantity : ${response.body}');
        cartquantity = ShowCartModel.fromJson(
            jsonDecode(response.body) as Map<String, dynamic>);

        emit(SuccessAddquantitytState());
      }
      getcart();
    } catch (e) {
      print(e.toString());
      emit(ErrorAddquantitytState());
    }
  }

  void deleteItem({int? id}) async {
    try {
      http.Response response =
          await http.delete(Uri.parse('${url}cart/${id}'), headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${CacheHelper.getData(key: 'token')}',
        'Accept': 'application/json',
        'Accept-Language': '${CacheHelper.getData(key: 'lang')}'
      });
      print('delete item : ${response.body}');
      getcart();
      // showCartModel = null;
    } catch (e) {
      print(e.toString());
      emit(ErrorShowCartState());
    }
  }

  void deleteAllCart() async {
    try {
      http.Response response =
          await http.delete(Uri.parse('${url}cart/clear'), headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${CacheHelper.getData(key: 'token')}',
        'Accept': 'application/json',
        'Accept-Language': '${CacheHelper.getData(key: 'lang')}'
      });
      getcart();
      showCartModel = null;
    } catch (e) {
      print(e.toString());
      emit(ErrorShowCartState());
    }
  }

  LastOrderModel? lastOrderModel;
  void getlastorder() async {
    try {
      http.Response response =
          await http.get(Uri.parse('${url}orders'), headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${CacheHelper.getData(key: 'token')}',
        'Accept': 'application/json',
        'Accept-Language': '${CacheHelper.getData(key: 'lang')}'
      });
      print(response.body);
      if (response.statusCode == 200) {
        lastOrderModel = LastOrderModel.fromJson(
            jsonDecode(response.body) as Map<String, dynamic>);
        emit(SuccessLastOrderState());
      }
    } catch (e) {
      print(e.toString());
      emit(ErrorLastOrderState());
    }
  }

  void searchproduct({String? item}) async {
    emit(LoadingSearchProductState());
    try {
      http.Response response = await http.get(
          Uri.parse('${url}medical-supplies/products?search=$item'),
          headers: {
            // 'Content-Type': 'application/json',
            'Authorization': 'Bearer ${CacheHelper.getData(key: 'token')}',
            'Accept': 'application/json',
            'Accept-Language': '${CacheHelper.getData(key: 'lang')}'
          });
      //
      print(response.request);
      if (response.statusCode == 200) {
        print(response.body);
        emit(SuccessSearchProductState(
            search: SearchModel.fromJson(
                jsonDecode(response.body) as Map<String, dynamic>)));
      }
    } catch (e) {
      print(e.toString());
      emit(ErrorSearchProductState(error: e.toString()));
    }
  }
}
