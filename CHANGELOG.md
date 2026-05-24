# Changelog

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
