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
    // ignore: avoid_print
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
/// Pensado solo para debugging: `HTTPProvider` lo agrega únicamente en
/// modo debug (nunca en release/profile). Nunca altera el flujo: siempre
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
}
