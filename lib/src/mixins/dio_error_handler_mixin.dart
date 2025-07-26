import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http_provider/src/exceptions/network_exception.dart';

/// Mixin para manejo de errores de Dio.
mixin DioErrorHandler {
  /// Procesa las excepciones de Dio.
  NetworkException manageNetworkException(dynamic error) {
    if (error is Exception) {
      try {
        NetworkException networkExceptions;
        if (error is DioException) {
          final message =
              'Error: ${error.message} - '
              'Uri: ${error.requestOptions.uri} - '
              'Headers: ${error.requestOptions.headers} - '
              'Request Data: ${error.requestOptions.data}';

          switch (error.type) {
            case DioExceptionType.sendTimeout:
              networkExceptions = NetworkException.sendTimeout(message);
            case DioExceptionType.connectionTimeout:
              networkExceptions = NetworkException.connectionTimeout(message);
            case DioExceptionType.receiveTimeout:
              networkExceptions = NetworkException.receiveTimeout(message);
            case DioExceptionType.badResponse:
              switch (error.response?.statusCode) {
                case 400:
                  networkExceptions = NetworkException.badRequest(message);

                case 401:
                  networkExceptions = NetworkException.unauthorized(message);

                case 403:
                  networkExceptions = NetworkException.forbidden(message);

                case 404:
                  networkExceptions = NetworkException.notFound(message);

                case 500:
                  networkExceptions = NetworkException.internalServerError(
                    message,
                  );

                case 503:
                  networkExceptions = NetworkException.serviceUnavailable(
                    message,
                  );

                default:
                  networkExceptions = NetworkException.defaultError(message);
              }

            case DioExceptionType.connectionError:
              networkExceptions = NetworkException.noInternetConnection(
                message,
              );
            case DioExceptionType.badCertificate:
              networkExceptions = NetworkException.badCertificate(message);
            case DioExceptionType.cancel:
              networkExceptions = NetworkException.requestCancelled(message);
            case DioExceptionType.unknown:
              networkExceptions = NetworkException.defaultError(message);
          }
        } else if (error is SocketException) {
          networkExceptions = NetworkException.noInternetConnection(error);
        } else {
          networkExceptions = NetworkException.unexpectedError(error);
        }
        return networkExceptions;
      } on FormatException catch (e) {
        return NetworkException.formatException(e);
      } on Exception catch (e) {
        return NetworkException.unexpectedError(e);
      }
    } else {
      if (error.toString().contains('is not a subtype of')) {
        return NetworkException.unableToProcess(error);
      } else {
        return NetworkException.unexpectedError(error);
      }
    }
  }
}
