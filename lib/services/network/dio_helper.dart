import 'package:dio/dio.dart';
// import 'package:softagi/shared/components/network/cache.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://my-clinic22.herokuapp.com/api/',
      receiveDataWhenStatusError: true,

      // receiveTimeout: 600 * 1000,
//      connectTimeout: 600 * 1000,
      // headers: {'Content-Type': 'application/json', 'lang': 'en'}
    ));
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? queryparameters,
    String lang = 'en',
    String? token,
  }) async {
    dio!.options.headers['Content-Type'] = 'application/json';
    dio!.options.headers['Accept-Language'] = lang;
    dio!.options.headers['Authorization'] = 'Bearer $token';
    return await dio!.get(url, queryParameters: queryparameters);
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? queryparameters,
    required dynamic data,
    String lang = 'en',
    String? token,
  }) async {
    dio!.options.headers['Accept'] = 'application/json';
    dio!.options.headers['Content-Type'] = 'application/json';
    dio!.options.headers['Accept-Language'] = lang;
    dio!.options.headers['Authorization'] = 'Bearer $token';
    return await dio!.post(
      url,
      data: data,
      queryParameters: queryparameters,
      options: Options(
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          }),
    );
  }

  static Future<Response> deleteData({
    required String url,
    required int? id,
    String lang = 'en',
    String? token,
  }) async {
    dio!.options.headers['Content-Type'] = 'application/json';
    dio!.options.headers['lang'] = lang;
    dio!.options.headers['Authorization'] = token;
    return await dio!.delete('${url}/${id}');
  }
}
