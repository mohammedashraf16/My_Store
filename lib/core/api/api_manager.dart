import 'package:dio/dio.dart';
import 'package:e_commerce/core/utils/constants_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@singleton
class ApiManager {
  late Dio dio;

  ApiManager() {
    dio = Dio();
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
        enabled: kDebugMode,
        filter: (options, args) {
          if (options.path.contains('/posts')) {
            return false;
          }
          return !args.isResponse || !args.hasUint8ListData;
        }));
  }

  Future<Response> getData(
      {required String endpoint,
      Map<String, dynamic>? parameters,
      Map<String, dynamic>? headers}) async {
    return dio.get(AppConstants.baseURL + endpoint,
        queryParameters: parameters,
        options: Options(headers: headers, validateStatus: (status) => true));
  }

  Future<Response> postData(
      {required String endpoint,
      Map<String, dynamic>? body,
      Map<String, dynamic>? headers}) async {
    return dio.post(AppConstants.baseURL+endpoint,
        data: body,
        options: Options(headers: headers, validateStatus: (status) => true));
  }
}
