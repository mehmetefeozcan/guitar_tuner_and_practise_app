enum ApiErrorType {
  network,
  timeout,
  unauthorized,
  forbidden,
  notFound,
  badRequest,
  server,
  cancelled,
  unknown,
}

class ApiException implements Exception {
  final String message;
  final int? statusCode;
  final ApiErrorType type;
  final dynamic responseData;

  const ApiException(
    this.message, {
    this.statusCode,
    this.type = ApiErrorType.unknown,
    this.responseData,
  });

  @override
  String toString() => 'ApiException[$type]: $message (status: $statusCode)';
}

sealed class Result<S, E extends Exception> {
  const Result();
}

final class Success<S, E extends Exception> extends Result<S, E> {
  final S data;
  const Success(this.data);
}

final class Failure<S, E extends Exception> extends Result<S, E> {
  final E error;
  const Failure(this.error);
}
