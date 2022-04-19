import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:clinic/constants.dart';
import 'package:clinic/end_points.dart';
import 'package:clinic/main.dart';
import 'package:clinic/model/about_us_model.dart';
import 'package:clinic/model/auth_model.dart';
import 'package:clinic/model/cart/add_to_cart_model.dart';
import 'package:clinic/model/cart/show_cart.dart';
import 'package:clinic/model/cities_model.dart';
import 'package:clinic/model/contact_info.dart';
import 'package:clinic/model/district_model.dart';
import 'package:clinic/model/last_order_model.dart';
import 'package:clinic/model/latest_news_model.dart';
import 'package:clinic/model/login_model.dart';
import 'package:clinic/model/medical_supplies.dart';
import 'package:clinic/model/order_model.dart';
import 'package:clinic/model/product_datails_model.dart';
import 'package:clinic/model/product_model.dart';
import 'package:clinic/model/search/search_model.dart';
import 'package:clinic/model/service_model.dart';
import 'package:clinic/model/specialist_model.dart';
import 'package:clinic/model/sub_category_model.dart';
import 'package:clinic/model/user_model.dart';
import 'package:clinic/services/cach_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
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
    try {
      emit(LoadingCategoriesState());
      http.Response response = await http.get(
          Uri.parse('${url}medical-supplies/categories/$id/subcategories'),
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
          Uri.parse('${url}medical-supplies/categories/$id/products'),
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
          Uri.parse('${url}medical-supplies/categories/$id/products'),
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
          .get(Uri.parse('${url}medical-supplies/products/$id'), headers: {
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

      // if (response.statusCode == 200) {
      model =
          UserModel.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
      print('city_id : ${model!.data!.address!.cityId}');
      print('district_id : ${model!.data!.address!.districtId}');
      print('details : ${model!.data!.address!.id}');
      //contact_method
      sendtokenfcm();
      getContactinfo();
      // }
      //  emit(SuccessUserInfoState());
    } catch (e) {
      print('error user info ${e.toString()}');
      emit(ErrorUserInfoState());
    }
  }

  File? profileImage;
  var picker = ImagePicker();

  Future changeProfileImage() async {
    final pickedFile = await picker.getImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      print(pickedFile.path);
      emit(SuccessChangeProfileImageState());
    } else {
      emit(ErrorChangeProfileImageState());
    }
  }

  void updateinfo({
    // String? imgurl,
    required String firstname,
    required String lastname,
    required String email,
    required String mobilenum,
    // required int cityid,
    // required int districtid,
    required String specialistid,
  }) async {
    try {
      // List<int> imageBytes = profileImage!.readAsBytesSync();
      // String baseimage = base64Encode(imageBytes);
      http.Response response = await http.post(
        Uri.parse('${url}users/me?_method=PUT'),
        headers: {
          // 'Content-Type': 'application/json',
          'Authorization': 'Bearer ${CacheHelper.getData(key: 'token')}',
          'Accept': 'application/json',
          'Accept-Language': '${CacheHelper.getData(key: 'lang')}'
        },
        body: {
          // 'photo': profileImage,
          'first_name': firstname,
          'last_name': lastname,
          'email': email,
          'mobile_number': mobilenum,
          'specialty_id': specialistid,
          // 'address': {
          //   'district_id': districtid,
          //   'city_id': cityid,
          // }
        },
      );
      print(response.body);
      var model = jsonDecode(response.body) as Map<String, dynamic>;
      if (response.statusCode == 200) {
        emit(SuccessUpdateUserInfoState());
      } else {
        emit(ErrorUserInfoState(error: model['message']));
      }
      //   var request = http.MultipartRequest(
      //       "POST", Uri.parse("${url}users/me?_method=PUT"));
      //   request.fields["first_name"] = firstname;
      //   request.fields["last_name"] = lastname;
      //   request.fields["email"] = email;
      //   request.fields["mobile_number"] = mobilenum;
      //   request.files.add(http.MultipartFile.fromBytes(
      //       '$profileImage', File(profileImage!.path).readAsBytesSync(),
      //       filename: profileImage!.path));
      //   var res = await request.send();

      //   emit(SuccessUpdateUserInfoState());
    } catch (e) {
      print('error user info ${e.toString()}');
      emit(ErrorUserInfoState(error: e.toString()));
    }
  }

  void getContactinfo() async {
    http.Response response =
        await http.get(Uri.parse('${url}contact-infos'), headers: {
      'Authorization': 'Bearer ${CacheHelper.getData(key: 'token')}',
      'Accept': 'application/json',
      'Accept-Language': '${CacheHelper.getData(key: 'lang')}'
    });
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
          await http.get(Uri.parse('${url}cities/$id/districts'), headers: {
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

  SpecialistModel? specialistModel;
  // List<dynamic> specialist = [];
  void getSpecialist() async {
    try {
      http.Response response =
          await http.get(Uri.parse('${url}specialties'), headers: {
        'Content-Type': 'application/json',
        // 'Authorization': 'Bearer ${token}',
        'Accept': 'application/json',
        'Accept-Language': 'en'
      });
      specialistModel = SpecialistModel.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
      emit(SuccessLoadSpecialist());
    } catch (e) {}
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
            'city_id': '$city',
            'district_id': '$destrict',
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
      print(response.body);
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
            'city_id': '$city',
            'district_id': '$district',
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
      print(response.body);
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
  void servicedetails({String? slug}) async {
    try {
      emit(LoadingGetServiceState());
      http.Response response =
          await http.get(Uri.parse('${url}services/$slug'), headers: {
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
    cart.add(id!);
    if (!cart.contains(id)) {
      emit(SuccessAddToCartState());
    }
    try {
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
          getcart();
        }
        // getcart();
        emit(SuccessAddToCartState());
      }
    } catch (e) {
      print(e.toString());
      emit(ErrorAddToCartState(error: e.toString()));
    }
  }

  // void addtocart2({Cart? item}) async {
  //   cart2.add(item!);
  //   if (!cart.contains(item)) {
  //     emit(SuccessAddToCartState());
  //   }
  //   try {
  //     http.Response response =
  //         await http.post(Uri.parse('${url}cart'), headers: {
  //       // 'Content-Type': 'application/json',
  //       'Authorization': 'Bearer ${CacheHelper.getData(key: 'token')}',
  //       'Accept': 'application/json',
  //       'Accept-Language': '${CacheHelper.getData(key: 'lang')}'
  //     }, body: {
  //       'product_ids[0]': item.cartProduct!.id.toString()
  //     });
  //     print(response.body);
  //     if (response.statusCode == 200) {
  //       // print(response.body);
  //       cartAddModel = CartAddModel.fromJson(
  //           jsonDecode(response.body) as Map<String, dynamic>);
  //       if (cartAddModel!.data!.attached!.isEmpty) {
  //         cart2.remove(item);
  //         getcart();
  //       }
  //       // getcart();
  //       emit(SuccessAddToCartState());
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //     emit(ErrorAddToCartState(error: e.toString()));
  //   }
  // }

  ShowCartModel? showCartModel;

  void getcart() async {
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
      // cart = [];
      listcartbuild();
      emit(SuccessShowCartState());
    } catch (e) {
      print(e.toString());
      emit(ErrorShowCartState());
    }
  }

  List<int> cart = [];
  List<Cart> cart2 = [];
  void listcartbuild() {
    cart = [];
    cart2 = [];
    for (var element in showCartModel!.data!.cart!) {
      cart.add(element.cartProduct!.id!);
      cart2.add(element);
    }
  }

  ShowCartModel? cartquantity;
  void updatequantity({int? id, dynamic quantity}) async {
    emit(LoadingAddquantitytState());
    try {
      http.Response response =
          await http.put(Uri.parse('${url}cart/$id'), body: {
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
          await http.delete(Uri.parse('${url}cart/$id'), headers: {
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

  void deleteItem2({Cart? item}) async {
    cart2.remove(item!);
    // if (!cart.contains(item)) {
    emit(SuccessAddToCartState());
    // }

    try {
      http.Response response = await http
          .delete(Uri.parse('${url}cart/${item.cartProduct!.id}'), headers: {
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

  void getlatestnews() async {
    try {
      http.Response response = await http.get(
          Uri.parse('${url}latest-news/posts?page=1&per_page=0'),
          headers: {
            'Authorization': 'Bearer ${CacheHelper.getData(key: 'token')}',
            'Accept': 'application/json',
            'Accept-Language': '${CacheHelper.getData(key: 'lang')}'
          });
      print(response.body);
      if (response.statusCode == 200) {
        emit(SuccessLatestNewsState(
            latestNewsModel: LatestNewsModel.fromJson(
                jsonDecode(response.body) as Map<String, dynamic>)));
      }
    } catch (e) {
      print(e.toString());
      emit(ErrorLatestNewsState(error: e.toString()));
    }
  }

  void signout() async {
    try {
      http.Response response =
          await http.get(Uri.parse('${url}logout'), headers: {
        'Authorization': 'Bearer ${CacheHelper.getData(key: 'token')}',
        'Accept': 'application/json',
        'Accept-Language': '${CacheHelper.getData(key: 'lang')}'
      });
      print('sign out : ${response.body}');
      model = null;
      cart = [];
      cartAddModel = null;
      contactInfoModel = null;
      await CacheHelper.removeData(key: 'token');
    } catch (e) {
      emit(ErrorLogOutState(error: e.toString()));
    }
  }

  AboutUsModel? aboutUsModel;
  void getaboutus() async {
    try {
      http.Response response =
          await http.get(Uri.parse('${url}about-us'), headers: {
        'Authorization': 'Bearer ${CacheHelper.getData(key: 'token')}',
        'Accept': 'application/json',
        'Accept-Language': '${CacheHelper.getData(key: 'lang')}'
      });
      print(response.body);
      // if (response.statusCode == 200) {
      aboutUsModel = AboutUsModel.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
      emit(SuccessAboutUsState());
      // }
    } catch (e) {
      print(e.toString());
      emit(ErrorAboutUsState());
    }
  }

  //Notifications

  void sendtokenfcm() async {
    try {
      http.Response response =
          await http.post(Uri.parse('${url}users/fcm-token'), body: {
        'token': '${CacheHelper.getData(key: 'token_msg')}'
      }, headers: {
        'Authorization': 'Bearer ${CacheHelper.getData(key: 'token')}',
        'Accept': 'application/json',
        'Accept-Language': '${CacheHelper.getData(key: 'lang')}'
      });
      print('fcm send token to API : ${response.body}');
      // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      //   RemoteNotification? notification = message.notification;
      //   AndroidNotification? android = message.notification?.android;
      //   if (notification != null && android != null) {
      //     flutterLocalNotificationsPlugin.show(
      //       notification.hashCode,
      //       notification.title,
      //       notification.body,
      //       NotificationDetails(
      //         android: AndroidNotificationDetails(
      //           channel.id,
      //           channel.name,
      //           channelDescription: channel.description,
      //           playSound: true,
      //         ),
      //       ),
      //     );
      //   }
      // });
      // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      //   RemoteNotification? notification = message.notification;
      //   AndroidNotification? android = message.notification?.android;
      //   if (notification != null && android != null) {
      //     showDialog(context: context, builder: builder)
      //   }
      // });
    } catch (e) {
      print('error send token : ${e.toString()}');
      emit(ErrorUserInfoState(error: e.toString()));
    }
  }
}
