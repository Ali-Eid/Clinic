import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:clinic/constants.dart';
import 'package:clinic/model/cities_model.dart';
import 'package:clinic/model/district_model.dart';
import 'package:clinic/model/login_model.dart';
import 'package:clinic/model/sign_up_error.dart';
import 'package:clinic/model/auth_model.dart';
import 'package:clinic/model/specialist_model.dart';
import 'package:clinic/services/cach_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(SignUpInitial());

  static AuthCubit get(context) => BlocProvider.of(context);

  CitiesModel? citiesModel;
  void getCities() async {
    try {
      http.Response response =
          await http.get(Uri.parse('${url}cities'), headers: {
        // 'Content-Type': 'application/json',
        // 'Authorization': 'Bearer ${token}',
        'Accept': 'application/json',
        'Accept-Language': 'en'
      });
      print(response.body);
      citiesModel = CitiesModel.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
      emit(SuccessLoadCities());
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

  String? valueDropDowncityspecilalist;
  void changevalueDropdownspecilalist(String val) {
    valueDropDowncityspecilalist = val;
    emit(SuccessChangevalueState());
  }

  DisrtictModel? disrictModel;
  void getDistrict({int? id}) async {
    valueDropDowndistrict = null;
    try {
      http.Response response =
          await http.get(Uri.parse('${url}cities/$id/districts'), headers: {
        // 'Content-Type': 'application/json',
        // 'Authorization': 'Bearer ${token}',
        'Accept': 'application/json',
        'Accept-Language': 'en'
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

  AuthModel? usermodel;

  void signup({
    required String firstname,
    required String lastname,
    required String email,
    required String password,
    required int cityid,
    required int districtid,
    required int specialistid,
  }) async {
    emit(LoadingAuthState());
    try {
      http.Response response = await http.post(Uri.parse('${url}users/signup'),
          body: jsonEncode({
            'first_name': firstname,
            'last_name': lastname,
            'email': email,
            'password': password,
            'specialty_id': specialistid,
            'address': {
              'district_id': districtid,
              'city_id': cityid,
            }
          }),
          headers: {
            'Content-Type': 'application/json',
            // 'Authorization': 'Bearer ${token}',
            'Accept': 'application/json',
            'Accept-Language': 'en'
          });
      print(response.body);

      if (response.statusCode == 200) {
        print(response.statusCode);
        usermodel = AuthModel.fromJson(
            jsonDecode(response.body) as Map<String, dynamic>);
        // await CacheHelper.saveData(key: 'token', value: usermodel!.data!.token);
        emit(SuccessAuthState(model: usermodel));
      }
      if (response.statusCode != 200) {
        SignUpErrorModel? errorModel = SignUpErrorModel.fromJson(
            jsonDecode(response.body) as Map<String, dynamic>);

        emit(ErrorInputAuthState(errormodel: errorModel));
      }
    } catch (e) {
      print(e.toString());
      emit(ErrorAuthState(error: e.toString()));
    }
  }

  // LoginModel? model;

  void submitlogin({
    required String email,
    required String password,
  }) async {
    emit(LoadingLoginState());
    try {
      http.Response response = await http.post(Uri.parse('${url}login'),
          body: jsonEncode({'email': email, 'password': password}),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Accept-Language': 'en'
          });
      print(response.body);
      print(response.statusCode);

      if (response.statusCode == 200) {
        usermodel = AuthModel.fromJson(
            jsonDecode(response.body) as Map<String, dynamic>);
        // await CacheHelper.saveData(key: 'token', value: usermodel!.data!.token);
        // CacheHelper.saveData(key: 'token', value: usermodel!.data!.token);
        emit(SuccessLoginState(loginmodel: usermodel));
      } else {
        print('error ${jsonDecode(response.body) as Map<String, dynamic>}');
        emit(ErrorLoginState(
            error: (jsonDecode(response.body)
                as Map<String, dynamic>)['message']));
      }
    } catch (e) {
      print(e.toString());
    }
  }

  bool isvisibility = true;
  void changeobsecurepassword() {
    isvisibility = !isvisibility;
    emit(ChangeVisibilityPasswordState());
  }

  void signout() async {
    try {
      http.Response response =
          await http.get(Uri.parse('${url}logout'), headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${CacheHelper.getData(key: 'token')}',
        'Accept': 'application/json',
        'Accept-Language': 'en'
      });
      print('sign out : ${response.body}');
      CacheHelper.removeData(key: 'token');
      emit(SuccessLogOutState());
    } catch (e) {
      emit(ErrorLogOutState());
    }
  }
}
