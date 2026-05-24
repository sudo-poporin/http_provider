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
    Dio? client,
    List<Interceptor> Function(Dio dio)? interceptorsBuilder,
  }) : _dio = client ?? Dio() {
    _dio
      ..options.connectTimeout = connectionTimeout
      ..options.receiveTimeout = receiveTimeout
      ..options.headers = headers;
    if (interceptorsBuilder != null) {
      _dio.interceptors.addAll(interceptorsBuilder(_dio));
    }
  }

  final Dio _dio;

  @override
  Future<Either<NetworkException, T>> get<T>(
    String path, {
    Map<String, dynamic> queryParameters = const {},
    Options? options,
  }) {
    return _request<T>(
      () => _dio.get<dynamic>(
        path,
        queryParameters: queryParameters,
        options: options ?? Options(),
      ),
    );
  }

  @override
  Future<Either<NetworkException, T>> post<T>(
    String path, {
    dynamic data,
    Options? options,
    Map<String, dynamic> queryParameters = const {},
  }) {
    return _request<T>(
      () => _dio.post<dynamic>(
        path,
        data: data,
        options: options ?? Options(),
        queryParameters: queryParameters,
      ),
    );
  }

  Future<Either<NetworkException, T>> _request<T>(
    Future<Response<dynamic>> Function() action,
  ) async {
    try {
      final response = await action();
      return Right(response as T);
    } on Exception catch (e) {
      return Left(manageNetworkException(e));
    }
    // El cast `as T` puede lanzar TypeError si T no coincide con la respuesta.
    // ignore: avoid_catching_errors
    on TypeError catch (e) {
      return Left(NetworkException.unableToProcess(e));
    }
  }

  /// Cierra el cliente Dio subyacente y libera recursos asociados.
  @override
  void close({bool force = false}) => _dio.close(force: force);
}
