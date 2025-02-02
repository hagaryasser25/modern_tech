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
          "x-api-key":
              '9699ac56afd6204e2f4051990965sfsdfgsdfg564rt68ikjjk7er5rtbr6um67',
          "lang": AppUtilities().languageCode,
          "os-type": Platform.isAndroid ? 'android' : "ios"
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
