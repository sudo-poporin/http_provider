import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http_provider/src/exceptions/network_exception.dart';
import 'package:http_provider/src/interceptors/retry_interceptor.dart';

/// Mixin para manejo de errores de Dio.
mixin DioErrorHandler {
  /// Procesa las excepciones de Dio y las mapea a [NetworkException].
  NetworkException manageNetworkException(Exception error) {
    if (error is DioRetriesExhaustedException) {
      return NetworkException.retriesExhausted(
        'Error: ${error.message} - '
        'Uri: ${error.requestOptions.uri} - '
        'Headers: ${error.requestOptions.headers} - '
        'Request Data: ${error.requestOptions.data}',
      );
    }
    if (error is DioException) {
      final message =
          'Error: ${error.message} - '
          'Uri: ${error.requestOptions.uri} - '
          'Headers: ${error.requestOptions.headers} - '
          'Request Data: ${error.requestOptions.data}';

      switch (error.type) {
        case DioExceptionType.sendTimeout:
          return NetworkException.sendTimeout(message);
        case DioExceptionType.connectionTimeout:
          return NetworkException.connectionTimeout(message);
        case DioExceptionType.receiveTimeout:
          return NetworkException.receiveTimeout(message);
        case DioExceptionType.transformTimeout:
          return NetworkException.transformTimeout(message);
        case DioExceptionType.badResponse:
          return _mapStatusCode(error.response?.statusCode, message);
        case DioExceptionType.connectionError:
          return NetworkException.noInternetConnection(message);
        case DioExceptionType.badCertificate:
          return NetworkException.badCertificate(message);
        case DioExceptionType.cancel:
          return NetworkException.requestCancelled(message);
        case DioExceptionType.unknown:
          return NetworkException.defaultError(message);
      }
    }
    if (error is SocketException) {
      return NetworkException.noInternetConnection(error);
    }
    if (error is FormatException) {
      return NetworkException.formatException(error);
    }
    return NetworkException.unexpectedError(error);
  }

  NetworkException _mapStatusCode(int? statusCode, String message) {
    switch (statusCode) {
      case 400:
        return NetworkException.badRequest(message);
      case 401:
        return NetworkException.unauthorized(message);
      case 403:
        return NetworkException.forbidden(message);
      case 404:
        return NetworkException.notFound(message);
      case 405:
        return NetworkException.methodNotAllowed(message);
      case 406:
        return NetworkException.notAcceptable(message);
      case 409:
        return NetworkException.conflict(message);
      case 429:
        return NetworkException.tooManyRequests(message);
      case 500:
        return NetworkException.internalServerError(message);
      case 501:
        return NetworkException.notImplemented(message);
      case 503:
        return NetworkException.serviceUnavailable(message);
      default:
        return NetworkException.defaultError(message);
    }
  }
}
