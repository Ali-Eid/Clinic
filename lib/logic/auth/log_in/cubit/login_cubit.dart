import 'package:bloc/bloc.dart';
import 'package:clinic/end_points.dart';
import 'package:clinic/model/login_model.dart';
import 'package:clinic/services/cach_helper.dart';
import 'package:clinic/services/network/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);

  LoginModel? model;
  void submitlogin({
    required String email,
    required String password,
  }) {
    emit(LoadingLoginState());
    var data = DioHelper.postData(
        url: LOGIN, data: {'email': email, 'password': password}).then((value) {
      print(value.data);
      model = LoginModel.fromJson(value.data);

      emit(SuccessLoginState(loginmodel: model));
    }).catchError((error) {
      print(error.toString());
      emit(ErrorLoginState());
    });
  }
}
