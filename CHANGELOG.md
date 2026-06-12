# Changelog

## 1.3.0

- feat: agrega `LoggerInterceptor` + `LoggerOptions` para loguear
  requests, responses y errores (método, URL, status, duración), con
  headers y body opcionales. Headers sensibles (`authorization`,
  `cookie`, `set-cookie`) se redactan a `***`; lista configurable.
- feat: `HTTPProvider` acepta `enableLogger` y `loggerOptions` en el
  constructor. Disponible solo en modo debug: gate compile-time vía
  `bool.fromEnvironment('dart.vm.product')` — en release/profile el
  flag es no-op y el código de logging se elimina por tree-shaking.
- docs: la instalación en el README ahora apunta al tag `v1.3.0` en
  lugar del branch `main`.

## 1.2.0

- feat: agrega `RetryInterceptor` con backoff exponencial configurable. Reintenta
  requests por status codes de una `Set<int>` configurable (default `{429}`),
  hasta `maxRetries` veces. Backoff: `initialBackoffMs * (1 << attempt)`.
- feat: agrega `NetworkException.retriesExhausted` para señalar agotamiento del
  retry budget. El marker `DioRetriesExhaustedException` (subclass de
  `DioException`) lo dispara y `DioErrorHandler.manageNetworkException` lo mapea.
- feat: `HTTPProvider` ahora acepta `interceptorsBuilder` opcional en el
  constructor — builder pattern para pasarle el `Dio` interno a interceptors
  que lo necesitan (como `RetryInterceptor`).
- **Breaking-soft** para consumers que usan `.when()` exhaustivo sobre
  `NetworkException`: requieren agregar la rama `retriesExhausted`. Quienes
  usan `.maybeWhen()` u `orElse` no necesitan cambios.

## 1.1.0

- feat: agrega `NetworkException.tooManyRequests` mapeada desde HTTP 429
  (rate limit). Permite a consumers distinguir rate limit de errores genéricos
  y aplicar retry exponencial reactivo.
- **Breaking-soft** para consumers que usan `.when()` exhaustivo sobre
  `NetworkException`: requieren agregar la rama `tooManyRequests`. Quienes
  usan `.maybeWhen()` u `orElse` no necesitan cambios.

## 1.0.15

- chore: bump de versión y actualización de dependencias.

## 1.0.14

- chore: bump de versión y actualización de dependencias.

## 1.0.13

- chore: bump de versión y actualización de dependencias.
