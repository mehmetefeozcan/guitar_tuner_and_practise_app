import 'package:studio_accordo_app_mobile/core/network/result.dart';

import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';

import 'dart:convert';

@injectable
class CustomDioService {
  final Dio dio;

  CustomDioService(this.dio);

  Future<Result<Response, ApiException>> getRequest(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    bool isEncrypted = true,
    CancelToken? cancelToken,
  }) async {
    try {
      Response response = await dio.get(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );

      return Success(response);
    } catch (e) {
      return Failure(_handleError(e));
    }
  }

  Future<Result<Response, ApiException>> postRequest(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    bool isEncrypted = true,
    CancelToken? cancelToken,
  }) async {
    try {
      Response response = await dio.post(
        path,
        data: data ?? {},
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );

      return Success(response);
    } catch (e) {
      return Failure(_handleError(e));
    }
  }

  Future<Result<Response, ApiException>> putRequest(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      Response response = await dio.put(
        path,
        data: data ?? {},
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );

      return Success(response);
    } catch (e) {
      return Failure(_handleError(e));
    }
  }

  Future<Result<Response, ApiException>> patchRequest(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      Response response = await dio.patch(
        path,
        data: data ?? {},
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );

      return Success(response);
    } catch (e) {
      return Failure(_handleError(e));
    }
  }

  Future<Result<Response, ApiException>> deleteRequest(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      Response response = await dio.delete(
        path,
        data: data ?? {},
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );

      return Success(response);
    } catch (e) {
      return Failure(_handleError(e));
    }
  }

  ApiException _handleError(Object e) {
    if (e is! DioException) {
      return ApiException(e.toString(), type: ApiErrorType.unknown);
    }

    if (e.type == DioExceptionType.cancel) {
      return ApiException('İstek iptal edildi.', type: ApiErrorType.cancelled);
    }

    final statusCode = e.response?.statusCode;

    return switch (e.type) {
      DioExceptionType.connectionError ||
      DioExceptionType.connectionTimeout => ApiException(
        'İnternet bağlantısı kurulamadı.',
        type: ApiErrorType.network,
        responseData: e.response?.data,
      ),

      DioExceptionType.receiveTimeout ||
      DioExceptionType.sendTimeout => ApiException(
        'Sunucu yanıt vermedi, lütfen tekrar deneyin.',
        type: ApiErrorType.timeout,
        responseData: e.response?.data,
      ),

      DioExceptionType.badResponse => _handleStatusCode(statusCode, e),

      _ => ApiException(
        _extractErrorMessage(e.response?.data) ??
            e.message ??
            'Beklenmeyen bir hata oluştu.',
        statusCode: statusCode,
        type: ApiErrorType.unknown,
        responseData: e.response?.data,
      ),
    };
  }

  ApiException _handleStatusCode(int? statusCode, DioException e) {
    final apiErrorMessage = _extractErrorMessage(e.response?.data);
    final responseData = e.response?.data;

    return switch (statusCode) {
      400 => ApiException(
        apiErrorMessage ?? 'Geçersiz istek.',
        statusCode: 400,
        type: ApiErrorType.badRequest,
        responseData: responseData,
      ),
      401 => ApiException(
        apiErrorMessage ?? 'Oturum süreniz doldu, lütfen tekrar giriş yapın.',
        statusCode: 401,
        type: ApiErrorType.unauthorized,
        responseData: responseData,
      ),
      403 => ApiException(
        apiErrorMessage ?? 'Bu işlem için yetkiniz bulunmuyor.',
        statusCode: 403,
        type: ApiErrorType.forbidden,
        responseData: responseData,
      ),
      404 => ApiException(
        apiErrorMessage ?? 'İstenen kaynak bulunamadı.',
        statusCode: 404,
        type: ApiErrorType.notFound,
        responseData: responseData,
      ),
      int s when s >= 500 => ApiException(
        apiErrorMessage ?? 'Sunucu hatası, lütfen daha sonra tekrar deneyin.',
        statusCode: s,
        type: ApiErrorType.server,
        responseData: responseData,
      ),
      _ => ApiException(
        apiErrorMessage ?? e.message ?? 'Beklenmeyen bir hata oluştu.',
        statusCode: statusCode,
        type: ApiErrorType.unknown,
        responseData: responseData,
      ),
    };
  }

  String? _extractErrorMessage(dynamic responseData) {
    if (responseData == null) return null;
    try {
      Map<String, dynamic>? jsonMap;
      if (responseData is Map<String, dynamic>) {
        jsonMap = responseData;
      } else if (responseData is Map) {
        jsonMap = Map<String, dynamic>.from(responseData);
      } else if (responseData is String) {
        final decoded = jsonDecode(responseData);
        if (decoded is Map<String, dynamic>) {
          jsonMap = decoded;
        } else if (decoded is Map) {
          jsonMap = Map<String, dynamic>.from(decoded);
        }
      }

      if (jsonMap != null) {
        final message = jsonMap['Message'] ?? jsonMap['message'];
        if (message != null && message.toString().trim().isNotEmpty) {
          return message.toString();
        }
      }
    } catch (_) {}
    return null;
  }
}
