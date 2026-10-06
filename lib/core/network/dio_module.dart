import 'package:studio_accordo_app_mobile/core/env/env.dart';

import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';

@module
abstract class DioModule {
  @preResolve
  @lazySingleton
  Future<Dio> dio() async {
    final dio = Dio(
      BaseOptions(
        baseUrl: Env.apiBaseUrl,
        receiveTimeout: const Duration(seconds: 35),
        connectTimeout: const Duration(seconds: 35),
        sendTimeout: const Duration(seconds: 35),
        contentType: 'application/json',
      ),
    );

    dio.interceptors.addAll([
      if (kDebugMode)
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 90,
        ),
    ]);

    return dio;
  }
}
