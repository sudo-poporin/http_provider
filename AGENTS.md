# AGENTS.md

This file provides guidance to Codex (Codex.ai/code) when working with code in this repository.

## Project Overview

`http_provider` is a Dart package that wraps Dio HTTP client with functional error handling using fpdart's `Either` pattern. Instead of throwing exceptions, all network operations return `Either<NetworkException, T>`, enabling type-safe, exhaustive error handling via pattern matching.

Current version: **1.1.0** | Dart SDK: `>=3.8.0 <4.0.0`

## Commands

```bash
# Install dependencies
dart pub get

# Run tests
dart test

# Run a single test file
dart test test/src/http_provider_test.dart

# Code generation (after modifying freezed classes)
dart run build_runner build --delete-conflicting-outputs

# Analyze code
dart analyze
```

## Architecture

```
lib/
├── http_provider.dart              # Barrel file: re-exports dio, exceptions, provider, interface
└── src/
    ├── http_provider.dart          # HTTPProvider - concrete implementation with Dio
    ├── i_http_provider.dart        # IHTTPProvider - abstract interface for DI/mocking
    ├── exceptions/
    │   ├── exceptions.dart         # Barrel file
    │   ├── network_exception.dart  # Freezed sealed class with 20+ error variants
    │   └── network_exception.freezed.dart  # Generated code (do not edit)
    └── mixins/
        ├── mixins.dart             # Barrel file
        └── dio_error_handler_mixin.dart  # Maps DioException → NetworkException
```

**Key design decisions:**

- **`DioErrorHandler` mixin** on `HTTPProvider` maps all Dio errors (status codes, timeouts, socket errors) to typed `NetworkException` variants via `manageNetworkException()`
- **`NetworkException`** is a freezed sealed class with variants like `unauthorized`, `noInternetConnection`, `receiveTimeout`, etc. — supports `.when()` pattern matching
- The barrel file at `lib/http_provider.dart` re-exports `package:dio/dio.dart`, so consumers get `Response`, `Options`, etc. without a separate dio import
- Methods `get<T>()` and `post<T>()` are generic — the response type flows through from Dio

## Testing

Tests use `mocktail` to mock `Dio` — no real network calls. They cover all `DioErrorHandler` branches (every `DioExceptionType`, every mapped HTTP status code, `SocketException`, `FormatException`) plus `HTTPProvider` happy/error paths and the `TypeError` cast fallback. CI enforces 100% coverage via `very_good_coverage`.

To inject a mock client: `HTTPProvider(client: mockDio)`.

## Code Generation

`NetworkException` uses `@freezed` annotation. After modifying `network_exception.dart`, regenerate with `dart run build_runner build --delete-conflicting-outputs`. Never edit `*.freezed.dart` files directly.
