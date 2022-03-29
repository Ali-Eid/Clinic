import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:clinic/constants.dart';
import 'package:clinic/end_points.dart';
import 'package:clinic/model/login_model.dart';
import 'package:clinic/model/medical_supplies.dart';
import 'package:clinic/model/order_model.dart';
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

  void getCategories() {
    emit(LoadingCategoriesState());
    var data = DioHelper.getData(
            url: CATEGORIES, token: CacheHelper.getData(key: 'token'))
        .then((value) {
      print(value.data);
      medicalModel = MedicalSupplies.fromJson(value.data);
      emit(SuccessCategoriesState());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorCategoriesState());
    });
  }

  UserModel? model;

  void meInfo() {
    var data = DioHelper.getData(url: ME, token: token).then((value) {
      model = UserModel.fromJson(value.data);
      print(value.data);
      print('city_id : ${model!.data!.address!.cityId}');
      print('district_id : ${model!.data!.address!.districtId}');
      print('details : ${model!.data!.address!.id}');
      emit(SuccessUserInfoState());
    }).catchError((error) {
      emit(ErrorUserInfoState());
    });
  }

  OrderModel? oredermodel;
  void requestmaintenance({
    required String moblilenum,
    required String serialnum,
    required String device,
    required String type,
    required String description,
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
            'details': '${model!.data!.address!.id}',
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
          'Authorization': 'Bearer ${token}',
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
}
