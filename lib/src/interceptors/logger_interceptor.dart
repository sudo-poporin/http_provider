import 'package:dio/dio.dart';

/// Opciones de configuración para [LoggerInterceptor].
class LoggerOptions {
  /// Crea las opciones del logger.
  ///
  /// - [logHeaders]: loguea headers de request/response, aplicando
  ///   redacción según [redactedHeaders].
  /// - [logBody]: loguea body de request/response. Sin redacción:
  ///   no activar en requests con credenciales o PII.
  /// - [logPrint]: sink de salida. Default: [print]; inyectable para
  ///   tests o para redirigir a otro logger.
  /// - [redactedHeaders]: headers cuyo valor se reemplaza por `***`
  ///   (comparación case-insensitive). Un set vacío desactiva la
  ///   redacción (solo para debugging local, no commitear).
  const LoggerOptions({
    this.logHeaders = false,
    this.logBody = false,
    this.logPrint = print,
    this.redactedHeaders = const {'authorization', 'cookie', 'set-cookie'},
  });

  /// Loguea headers de request/response (con redacción).
  final bool logHeaders;

  /// Loguea body de request/response (sin redacción).
  final bool logBody;

  /// Sink de salida del logger.
  final void Function(String message) logPrint;

  /// Headers cuyo valor se redacta a `***` (case-insensitive).
  final Set<String> redactedHeaders;
}

/// Interceptor de Dio que loguea requests, responses y errores.
///
/// Pensado solo para debugging. La vía de uso prevista es
/// `HTTPProvider(enableLogger: true)`: el gate que lo limita a modo debug
/// vive en `HTTPProvider`, no acá — quien lo agregue manualmente a un Dio
/// propio queda fuera de esa protección. Nunca altera el flujo: siempre
/// llama `handler.next(...)`.
///
/// Duración per-request vía
/// `requestOptions.extra['http_provider.loggerStart']` para evitar race
/// conditions con requests concurrentes.
class LoggerInterceptor extends Interceptor {
  /// Crea el interceptor con [options].
  LoggerInterceptor({this.options = const LoggerOptions()});

  /// Configuración del logger.
  final LoggerOptions options;

  static const _startKey = 'http_provider.loggerStart';

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.extra[_startKey] = DateTime.now();
    this.options.logPrint('🚀 ${options.method} ${options.uri}');
    if (this.options.logHeaders) {
      this.options.logPrint('  headers: ${_redact(options.headers)}');
    }
    if (this.options.logBody && options.data != null) {
      this.options.logPrint('  body: ${options.data}');
    }
    handler.next(options);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    final request = response.requestOptions;
    options.logPrint(
      '✅ ${response.statusCode ?? '?'} ${request.method} '
      '${request.uri.path} (${_elapsedMs(request)}ms)',
    );
    if (options.logHeaders) {
      options.logPrint('  headers: ${_redact(response.headers.map)}');
    }
    if (options.logBody && response.data != null) {
      options.logPrint('  body: ${response.data}');
    }
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final request = err.requestOptions;
    final status = err.response?.statusCode?.toString() ?? err.type.name;
    options.logPrint(
      '❌ $status ${request.method} '
      '${request.uri.path} (${_elapsedMs(request)}ms)',
    );
    handler.next(err);
  }

  int _elapsedMs(RequestOptions request) {
    final start = request.extra[_startKey];
    if (start is! DateTime) {
      return 0;
    }
    return DateTime.now().difference(start).inMilliseconds;
  }

  Map<String, Object?> _redact(Map<String, Object?> headers) {
    return {
      for (final entry in headers.entries)
        entry.key: options.redactedHeaders.contains(entry.key.toLowerCase())
            ? '***'
            : entry.value,
    };
  }
}
