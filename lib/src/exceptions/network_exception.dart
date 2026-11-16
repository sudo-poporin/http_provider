import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_exception.freezed.dart';

/// Excepciones de red.
@freezed
abstract class NetworkException with _$NetworkException implements Exception {
  /// Petición cancelada.
  const factory requestCancelled([dynamic error]) = RequestCancelled;

  /// Petición no autorizada.
  const factory unauthorized([dynamic error]) = UnauthorisedRequest;

  /// Mal formada.
  const factory badRequest([dynamic error]) = BadRequest;

  /// Certificado inválido.
  const factory badCertificate([dynamic error]) = BadCertificate;

  /// Prohibida.
  const factory forbidden([dynamic error]) = Forbidden;

  /// No encontrada.
  const factory notFound([dynamic error]) = NotFound;

  /// Método no permitido.
  const factory methodNotAllowed([dynamic error]) = MethodNotAllowed;

  /// No aceptable.
  const factory notAcceptable([dynamic error]) = NotAcceptable;

  /// Demasiadas peticiones (rate limit).
  const factory tooManyRequests([dynamic error]) = TooManyRequests;

  /// Retries del interceptor agotados (status code retriable persistente).
  const factory retriesExhausted([dynamic error]) = RetriesExhausted;

  /// Tiempo de espera agotado.
  const factory receiveTimeout([dynamic error]) = ReceiveTimeout;

  /// Tiempo de transformación de la respuesta agotado (decode/JSON).
  const factory transformTimeout([dynamic error]) = TransformTimeout;

  /// Tiempo de petición agotado.
  const factory requestTimeout([dynamic error]) = RequestTimeout;

  /// Tiempo de envío agotado.
  const factory sendTimeout([dynamic error]) = SendTimeout;

  /// Tiempo de conexión agotado.
  const factory connectionTimeout([dynamic error]) = ConnectionTimeout;

  /// Conflictiva.
  const factory conflict([dynamic error]) = Conflict;

  /// Error interno del servidor.
  const factory internalServerError([dynamic error]) = InternalServerError;

  /// No implementada.
  const factory notImplemented([dynamic error]) = NotImplemented;

  /// Servicio no disponible.
  const factory serviceUnavailable([dynamic error]) = ServiceUnavailable;

  /// Error de conexión.
  const factory noInternetConnection([dynamic error]) = NoInternetConnection;

  /// Error de formato.
  const factory formatException([dynamic error]) = FormatException;

  /// No procesable.
  const factory unableToProcess([dynamic error]) = UnableToProcess;

  /// Error por defecto.
  const factory defaultError([dynamic error]) = DefaultError;

  /// Error inesperado.
  const factory unexpectedError([dynamic error]) = UnexpectedError;
}
