import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../helpers/app_utilities.dart';

class DioFactory {
  DioFactory._();

  static Dio? dio;

  static Future<Dio> getDio() async {
    await AppUtilities.instance
        .importantInitialize(); // Ensure data is loaded before creating Dio

    Duration timeOut = const Duration(seconds: 30);
    log("current token is ${AppUtilities().serverToken}");
    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut
        ..options.headers = {
          "lang": AppUtilities().languageCode,
          "os-type": Platform.isAndroid ? 'android' : "ios",
          "Accept": "application/json"
        };

      addDioInterceptor();
      return dio!;
    } else {
      return dio!;
    }
  }

  static void addDioInterceptor() {
    dio?.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
  }
}
