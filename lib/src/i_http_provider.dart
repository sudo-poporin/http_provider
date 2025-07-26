import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http_provider/src/exceptions/exceptions.dart';

/// Interfaz del proveedor HTTP.
abstract interface class IHTTPProvider {
  /// Realiza una petición GET al servidor.
  Future<Either<NetworkException, T>> get<T>(
    String path, {
    Map<String, dynamic> queryParameters = const {},
    Options? options,
  });

  /// Realiza una petición POST al servidor.
  Future<Either<NetworkException, T>> post<T>(
    String path, {
    dynamic data,
    Options? options,
    Map<String, dynamic> queryParameters = const {},
  });
}
