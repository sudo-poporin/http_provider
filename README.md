# HTTP Provider 📡

[![Tests](https://github.com/sudo-poporin/http_provider/actions/workflows/test.yml/badge.svg)](https://github.com/sudo-poporin/http_provider/actions/workflows/test.yml)
[![coverage: 100%](https://img.shields.io/badge/coverage-100%25-brightgreen)](https://github.com/sudo-poporin/http_provider/actions/workflows/test.yml)
[![style: very good analysis](https://img.shields.io/badge/style-very_good_analysis-B22C89.svg)](https://pub.dev/packages/very_good_analysis)
[![Dart](https://img.shields.io/badge/Dart-%230175C2.svg?logo=dart&logoColor=white)](https://dart.dev)

Paquete para obtener información de forma remota mediante peticiones HTTP.

## Características ✨

- Soporte para peticiones GET y POST
- Manejo de errores con patrón Either (fpdart)
- Timeouts configurables (conexión y recepción)
- 21+ tipos de excepciones específicas para diferentes escenarios
- Interface `IHTTPProvider` para testing y mocking
- Exporta Dio directamente para configuración avanzada

## Instalación 💻

Instalar a través del archivo `pubspec.yaml` añadiendo la dependencia:

```yaml
dependencies:
  http_provider:
    git:
      url: https://github.com/sudo-poporin/http_provider
      ref: main
```

## Configuración ⚙️

### Parámetros del constructor

| Parámetro | Tipo | Default | Descripción |
|-----------|------|---------|-------------|
| `connectionTimeout` | `Duration` | 30 segundos | Tiempo máximo para establecer conexión |
| `receiveTimeout` | `Duration` | 30 segundos | Tiempo máximo para recibir respuesta |
| `headers` | `Map<String, dynamic>` | `{}` | Headers por defecto para todas las peticiones |
| `client` | `Dio?` | `null` | Cliente Dio inyectable (útil para testing) |

### Ejemplo de configuración personalizada

```dart
final httpProvider = HTTPProvider(
  connectionTimeout: const Duration(seconds: 15),
  receiveTimeout: const Duration(seconds: 15),
  headers: {
    'Authorization': 'Bearer token',
    'Content-Type': 'application/json',
  },
);
```

## Uso 📖

Este paquete proporciona una interfaz para interactuar con servicios web
RESTful utilizando HTTP. Permite realizar solicitudes GET y POST de manera
sencilla.

Internamente, utiliza la biblioteca [Dio](https://pub.dev/packages/dio) para
manejar las solicitudes HTTP y las respuestas.

También implementa un manejo de errores robusto a través de excepciones
personalizadas y respuestas encapsuladas siguiendo el patrón Either de la
biblioteca [fpdart](https://pub.dev/packages/fpdart).

### Ejemplo GET

```dart
import 'package:http_provider/http_provider.dart';

Future<void> main() async {
  final httpProvider = HTTPProvider();

  const path = 'https://pokeapi.co/api/v2/pokemon/porygon2';

  final responseEither = await httpProvider.get<Response<dynamic>>(
    path,
    options: Options(
      headers: {'Content-Type': 'application/json'},
    ),
  );

  responseEither.fold(
    (error) => print('Error: $error'),
    (response) => print('Response: ${response.data}'),
  );
}
```

### Ejemplo POST

```dart
final result = await httpProvider.post<Response<dynamic>>(
  'https://api.example.com/users',
  data: {
    'name': 'John Doe',
    'email': 'john@example.com',
  },
  queryParameters: {'version': '1'},
  options: Options(
    headers: {'Content-Type': 'application/json'},
  ),
);

result.fold(
  (error) => print('Error: $error'),
  (response) => print('Usuario creado: ${response.data}'),
);
```

## Manejo de Errores 🛡️

El paquete utiliza el patrón Either para manejar errores de forma segura sin
necesidad de bloques try-catch.

### Manejo básico

```dart
responseEither.fold(
  (error) => print('Error: $error'),
  (response) => print('Éxito: ${response.data}'),
);
```

### Manejo exhaustivo con pattern matching

```dart
responseEither.fold(
  (error) => error.when(
    unauthorized: (msg) => print('No autorizado: $msg'),
    badRequest: (msg) => print('Solicitud inválida: $msg'),
    notFound: (msg) => print('No encontrado: $msg'),
    forbidden: (msg) => print('Acceso prohibido: $msg'),
    connectionTimeout: (msg) => print('Timeout de conexión: $msg'),
    receiveTimeout: (msg) => print('Timeout de recepción: $msg'),
    noInternetConnection: (msg) => print('Sin conexión a internet: $msg'),
    internalServerError: (msg) => print('Error del servidor: $msg'),
    serviceUnavailable: (msg) => print('Servicio no disponible: $msg'),
    requestCancelled: (msg) => print('Petición cancelada: $msg'),
    badCertificate: (msg) => print('Certificado inválido: $msg'),
    methodNotAllowed: (msg) => print('Método no permitido: $msg'),
    notAcceptable: (msg) => print('No aceptable: $msg'),
    requestTimeout: (msg) => print('Timeout de petición: $msg'),
    sendTimeout: (msg) => print('Timeout de envío: $msg'),
    conflict: (msg) => print('Conflicto: $msg'),
    tooManyRequests: (msg) => print('Rate limit excedido: $msg'),
    notImplemented: (msg) => print('No implementado: $msg'),
    formatException: (msg) => print('Error de formato: $msg'),
    unableToProcess: (msg) => print('No se pudo procesar: $msg'),
    defaultError: (msg) => print('Error del servidor: $msg'),
    unexpectedError: (msg) => print('Error inesperado: $msg'),
  ),
  (response) => print('Éxito: ${response.data}'),
);
```

## Tipos de Excepciones 🚨

El paquete define `NetworkException` como una sealed class con los siguientes
tipos:

### Errores HTTP

| Excepción | Código | Descripción |
|-----------|--------|-------------|
| `badRequest` | 400 | Solicitud inválida |
| `unauthorized` | 401 | No autorizado |
| `forbidden` | 403 | Acceso prohibido |
| `notFound` | 404 | Recurso no encontrado |
| `methodNotAllowed` | 405 | Método no permitido |
| `notAcceptable` | 406 | No aceptable |
| `conflict` | 409 | Conflicto |
| `tooManyRequests` | 429 | Rate limit excedido |
| `internalServerError` | 500 | Error interno del servidor |
| `notImplemented` | 501 | No implementado |
| `serviceUnavailable` | 503 | Servicio no disponible |

### Errores de Timeout

| Excepción | Descripción |
|-----------|-------------|
| `connectionTimeout` | Tiempo de conexión excedido |
| `receiveTimeout` | Tiempo de recepción excedido |
| `sendTimeout` | Tiempo de envío excedido |
| `requestTimeout` | Tiempo de petición excedido |

### Errores de Red y Otros

| Excepción | Descripción |
|-----------|-------------|
| `noInternetConnection` | Sin conexión a internet |
| `requestCancelled` | Petición cancelada |
| `badCertificate` | Error de certificado SSL/TLS |
| `formatException` | Error de formato JSON |
| `unableToProcess` | Error de casting/tipo |
| `defaultError` | Error genérico del servidor |
| `unexpectedError` | Error inesperado |

## API Reference 📚

### HTTPProvider

```dart
class HTTPProvider with DioErrorHandler implements IHTTPProvider
```

#### Constructor

```dart
HTTPProvider({
  Duration connectionTimeout = const Duration(milliseconds: 30000),
  Duration receiveTimeout = const Duration(milliseconds: 30000),
  Map<String, dynamic> headers = const {},
})
```

#### Métodos

##### get\<T\>()

Realiza una petición GET.

```dart
Future<Either<NetworkException, T>> get<T>(
  String path, {
  Map<String, dynamic> queryParameters = const {},
  Options? options,
})
```

| Parámetro | Tipo | Requerido | Descripción |
|-----------|------|-----------|-------------|
| `path` | `String` | Sí | URL completa del endpoint |
| `queryParameters` | `Map<String, dynamic>` | No | Parámetros de query string |
| `options` | `Options?` | No | Opciones de Dio (headers, etc.) |

##### post\<T\>()

Realiza una petición POST.

```dart
Future<Either<NetworkException, T>> post<T>(
  String path, {
  dynamic data,
  Options? options,
  Map<String, dynamic> queryParameters = const {},
})
```

| Parámetro | Tipo | Requerido | Descripción |
|-----------|------|-----------|-------------|
| `path` | `String` | Sí | URL completa del endpoint |
| `data` | `dynamic` | No | Cuerpo de la petición |
| `queryParameters` | `Map<String, dynamic>` | No | Parámetros de query string |
| `options` | `Options?` | No | Opciones de Dio (headers, etc.) |

## Retry Interceptor (v1.2.0+)

`RetryInterceptor` reintenta requests con backoff exponencial cuando el response tiene un status code retriable (default: `429`). Tras agotar `maxRetries`, propaga `DioRetriesExhaustedException`, que el mixin mapea a `NetworkException.retriesExhausted`.

```dart
final provider = HTTPProvider(
  interceptorsBuilder: (dio) => [
    RetryInterceptor(
      dio: dio,
      maxRetries: 2,
      initialBackoffMs: 500,
      retryStatusCodes: const {429},
    ),
  ],
);
```

Secuencia de delays con defaults: 500ms, 1000ms (peor caso 1.5s acumulado antes de que el último error se propague como `retriesExhausted`).

**Aislamiento per-request:** el counter de retries vive en `requestOptions.extra['http_provider.retryAttempt']`, no como state del interceptor. Múltiples requests concurrentes no se afectan entre sí.

**Aplica a `post` y `get`:** el interceptor es de Dio, opera sobre cualquier método HTTP.

## Dependencias 📦

| Paquete | Uso |
|---------|-----|
| [dio](https://pub.dev/packages/dio) | Cliente HTTP |
| [fpdart](https://pub.dev/packages/fpdart) | Patrón Either para manejo de errores |
| [freezed](https://pub.dev/packages/freezed) | Generación de sealed classes |
