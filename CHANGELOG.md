# Changelog

## [2.0.0] - 2026-11-15

### Modificado

- **Cambio que rompe:** el SDK mínimo de Dart pasa a `^3.14.0` (antes `>=3.8.0 <4.0.0`). La API
  pública no cambia.
  - Migración: subir el proyecto que lo consume a Dart 3.14 o posterior (Flutter 3.50 o
    posterior) y apuntar el `ref:` a `v2.0.0`. No hace falta tocar código.
- `dio` sube a `^5.11.1`.

### Interno

- `build_runner` sube a `^2.17.1`, `freezed` a `^4.0.3`, `test` a `^1.33.0` y
  `very_good_analysis` a `^11.0.0`. `NetworkException` se regenera con freezed 4, sin cambios en
  lo que genera hacia afuera.
- Lints nuevos de `very_good_analysis` 11 corregidos con `dart fix`: constructores con la
  sintaxis de Dart 3.14 (`new(...)`, factories sin el nombre del tipo) y cuerpos de clase vacíos
  como `;`. Se saca `unnecessary_await_in_return`, deprecada, de `analysis_options.yaml`.
- `dart format` sobre todo el paquete.

## 1.4.0

- feat: agrega `NetworkException.transformTimeout` para el nuevo
  `DioExceptionType.transformTimeout` de dio 5.11 (timeout al
  transformar/decodificar la respuesta), diferenciado de `receiveTimeout`.
- chore: bump `dio` a `^5.11.0`.
- docs: la instalación en el README ahora apunta al tag `v1.4.0`.

## 1.3.1

- chore: bump `very_good_analysis` a `^10.3.0`.
- chore: agrega `AGENTS.md` y `.codegraph/` al `.gitignore`.
- docs: la instalación en el README ahora apunta al tag `v1.3.1`.

## 1.3.0

- feat: agrega `LoggerInterceptor` + `LoggerOptions` para loguear
  requests, responses y errores (método, URL, status, duración), con
  headers y body opcionales. Headers sensibles (`authorization`,
  `cookie`, `set-cookie`) se redactan a `***`; lista configurable.
- feat: `HTTPProvider` acepta `enableLogger` y `loggerOptions` en el
  constructor. Disponible solo en modo debug: gate compile-time vía
  `bool.fromEnvironment` (`dart.vm.product`/`dart.vm.profile`) — en
  release/profile el flag es no-op y el código de logging se elimina
  por tree-shaking.
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
