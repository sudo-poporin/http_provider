import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_exception.freezed.dart';

/// Excepciones de red.
@freezed
abstract class NetworkException with _$NetworkException implements Exception {
  /// Petición cancelada.
  const factory NetworkException.requestCancelled([dynamic error]) =
      RequestCancelled;

  /// Petición no autorizada.
  const factory NetworkException.unauthorized([dynamic error]) =
      UnauthorisedRequest;

  /// Mal formada.
  const factory NetworkException.badRequest([dynamic error]) = BadRequest;

  /// Certificado inválido.
  const factory NetworkException.badCertificate([dynamic error]) =
      BadCertificate;

  /// Prohibida.
  const factory NetworkException.forbidden([dynamic error]) = Forbidden;

  /// No encontrada.
  const factory NetworkException.notFound([dynamic error]) = NotFound;

  /// Método no permitido.
  const factory NetworkException.methodNotAllowed([dynamic error]) =
      MethodNotAllowed;

  /// No aceptable.
  const factory NetworkException.notAcceptable([dynamic error]) = NotAcceptable;

  /// Tiempo de espera agotado.
  const factory NetworkException.receiveTimeout([dynamic error]) =
      ReceiveTimeout;

  /// Tiempo de petición agotado.
  const factory NetworkException.requestTimeout([dynamic error]) =
      RequestTimeout;

  /// Tiempo de envío agotado.
  const factory NetworkException.sendTimeout([dynamic error]) = SendTimeout;

  /// Tiempo de conexión agotado.
  const factory NetworkException.connectionTimeout([dynamic error]) =
      ConnectionTimeout;

  /// Conflictiva.
  const factory NetworkException.conflict([dynamic error]) = Conflict;

  /// Error interno del servidor.
  const factory NetworkException.internalServerError([dynamic error]) =
      InternalServerError;

  /// No implementada.
  const factory NetworkException.notImplemented([dynamic error]) =
      NotImplemented;

  /// Servicio no disponible.
  const factory NetworkException.serviceUnavailable([dynamic error]) =
      ServiceUnavailable;

  /// Error de conexión.
  const factory NetworkException.noInternetConnection([dynamic error]) =
      NoInternetConnection;

  /// Error de formato.
  const factory NetworkException.formatException([dynamic error]) =
      FormatException;

  /// No procesable.
  const factory NetworkException.unableToProcess([dynamic error]) =
      UnableToProcess;

  /// Error por defecto.
  const factory NetworkException.defaultError([dynamic error]) = DefaultError;

  /// Error inesperado.
  const factory NetworkException.unexpectedError([dynamic error]) =
      UnexpectedError;
}
