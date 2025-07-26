import 'package:fpdart/fpdart.dart';
import 'package:http_provider/http_provider.dart';
import 'package:http_provider/src/mixins/mixins.dart';

/// Clase de implementación del cliente HTTP
class HTTPProvider with DioErrorHandler implements IHTTPProvider {
  /// Cliente HTTP de la aplicación.
  HTTPProvider({
    Duration connectionTimeout = const Duration(milliseconds: 30000),
    Duration receiveTimeout = const Duration(milliseconds: 30000),
    Map<String, dynamic> headers = const {},
  }) : _dio = Dio(),
       _connectionTimeout = connectionTimeout,
       _receiveTimeout = receiveTimeout,
       _headers = headers {
    _dio
      ..options.connectTimeout = _connectionTimeout
      ..options.receiveTimeout = _receiveTimeout
      ..options.headers = _headers;
  }

  final Dio _dio;
  final Duration _connectionTimeout;
  final Duration _receiveTimeout;
  final Map<String, dynamic> _headers;

  @override
  Future<Either<NetworkException, T>> post<T>(
    String path, {
    dynamic data,
    Options? options,
    Map<String, dynamic> queryParameters = const {},
  }) async {
    try {
      final response =
          await _dio.post<dynamic>(
                path,
                data: data,
                options: options ?? Options(),
                queryParameters: queryParameters,
              )
              as T;

      return Right(response);
    } on Exception catch (e) {
      return Left(super.manageNetworkException(e));
    }
  }

  @override
  Future<Either<NetworkException, T>> get<T>(
    String path, {
    Map<String, dynamic> queryParameters = const {},
    Options? options,
  }) async {
    try {
      final response =
          await _dio.get<dynamic>(
                path,
                queryParameters: queryParameters,
                options: options ?? Options(),
              )
              as T;

      return Right(response);
    } on Exception catch (e) {
      return Left(super.manageNetworkException(e));
    }
  }
}
