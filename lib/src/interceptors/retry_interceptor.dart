import 'package:dio/dio.dart';
import 'package:http_provider/src/exceptions/network_exception.dart';

/// Interceptor de Dio que reintenta requests fallidos por status codes
/// configurables, con backoff exponencial.
///
/// State per-request via `requestOptions.extra['http_provider.retryAttempt']`
/// para evitar race conditions cuando múltiples requests están en vuelo
/// simultáneamente.
class RetryInterceptor extends Interceptor {
  /// Crea el interceptor.
  ///
  /// - [dio]: instancia que se usa para re-emitir el request via
  ///   `dio.fetch(requestOptions)`.
  /// - [maxRetries]: cantidad máxima de retries (no incluye el primer intento).
  /// - [initialBackoffMs]: delay base. El delay del attempt N es
  ///   `initialBackoffMs * (1 << N)` ms.
  /// - [retryStatusCodes]: status codes que disparan retry. Default: `{429}`.
  RetryInterceptor({
    required this.dio,
    this.maxRetries = 2,
    this.initialBackoffMs = 500,
    this.retryStatusCodes = const {429},
  });

  /// Dio instance usado para re-emitir el request.
  final Dio dio;

  /// Cantidad máxima de retries (no incluye el primer intento).
  final int maxRetries;

  /// Delay base del backoff exponencial (ms).
  final int initialBackoffMs;

  /// Status codes que disparan retry.
  final Set<int> retryStatusCodes;

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final status = err.response?.statusCode;
    if (status == null || !retryStatusCodes.contains(status)) {
      return handler.next(err);
    }
    // Retry path se implementa en Task 6.
    return handler.next(err);
  }
}

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
