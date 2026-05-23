import 'package:dio/dio.dart';
import 'package:http_provider/src/exceptions/network_exception.dart';

/// Marker subclass de [DioException] que indica que el `RetryInterceptor`
/// agotó su budget de retries. El `DioErrorHandler` mapea esto a
/// [NetworkException.retriesExhausted].
class DioRetriesExhaustedException extends DioException {
  /// Crea la exception a partir del último [DioException] que disparó el
  /// retry budget exhausted.
  DioRetriesExhaustedException(DioException source)
    : super(
        requestOptions: source.requestOptions,
        response: source.response,
        type: source.type,
        error: source.error,
        stackTrace: source.stackTrace,
        message: source.message,
      );
}
