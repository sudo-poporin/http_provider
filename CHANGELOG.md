# Changelog

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
