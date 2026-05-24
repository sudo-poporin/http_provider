import 'dart:async';

import 'package:fake_async/fake_async.dart';
import 'package:http_provider/http_provider.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class _MockDio extends Mock implements Dio {}

class _MockHandler extends Mock implements ErrorInterceptorHandler {}

class _FakeRequestOptions extends Fake implements RequestOptions {}

class _FakeDioException extends Fake implements DioException {}

class _FakeResponse extends Fake implements Response<dynamic> {}

void main() {
  setUpAll(() {
    registerFallbackValue(_FakeRequestOptions());
    registerFallbackValue(_FakeDioException());
    registerFallbackValue(_FakeResponse());
  });

  group('RetryInterceptor', () {
    late Dio dio;
    late ErrorInterceptorHandler handler;
    late RetryInterceptor interceptor;

    setUp(() {
      dio = _MockDio();
      handler = _MockHandler();
      interceptor = RetryInterceptor(dio: dio);
    });

    test('no retry cuando el error no tiene status code en la set', () {
      fakeAsync((async) {
        final err = DioException(
          requestOptions: RequestOptions(path: '/test'),
          response: Response<dynamic>(
            requestOptions: RequestOptions(path: '/test'),
            statusCode: 500,
          ),
          type: DioExceptionType.badResponse,
        );

        unawaited(interceptor.onError(err, handler));
        async.flushMicrotasks();

        verifyNever(() => dio.fetch<dynamic>(any()));
        verify(() => handler.next(err)).called(1);
      });
    });

    test('429 → 200: 1 retry, 500ms transcurrido, handler.resolve', () {
      fakeAsync((async) {
        final reqOptions = RequestOptions(path: '/test');
        final err = DioException(
          requestOptions: reqOptions,
          response: Response<dynamic>(
            requestOptions: reqOptions,
            statusCode: 429,
          ),
          type: DioExceptionType.badResponse,
        );

        final successResponse = Response<dynamic>(
          requestOptions: reqOptions,
          statusCode: 200,
          data: 'ok',
        );
        when(
          () => dio.fetch<dynamic>(any()),
        ).thenAnswer((_) async => successResponse);

        unawaited(interceptor.onError(err, handler));

        // Antes del delay: nada.
        async.elapse(const Duration(milliseconds: 499));
        verifyNever(() => dio.fetch<dynamic>(any()));

        // Tras 500ms: dispara fetch.
        async
          ..elapse(const Duration(milliseconds: 1))
          ..flushMicrotasks();

        verify(() => dio.fetch<dynamic>(any())).called(1);
        verify(() => handler.resolve(successResponse)).called(1);
        verifyNever(() => handler.next(any()));
      });
    });

    test('429 → primer retry falla 429: propaga handler.next con DioException', () {
      fakeAsync((async) {
        final reqOptions = RequestOptions(path: '/test');
        final err = DioException(
          requestOptions: reqOptions,
          response: Response<dynamic>(
            requestOptions: reqOptions,
            statusCode: 429,
          ),
          type: DioExceptionType.badResponse,
        );

        final successResponse = Response<dynamic>(
          requestOptions: reqOptions,
          statusCode: 200,
          data: 'ok',
        );

        var fetchCallCount = 0;
        when(() => dio.fetch<dynamic>(any())).thenAnswer((_) async {
          fetchCallCount++;
          if (fetchCallCount == 1) {
            throw DioException(
              requestOptions: reqOptions,
              response: Response<dynamic>(
                requestOptions: reqOptions,
                statusCode: 429,
              ),
              type: DioExceptionType.badResponse,
            );
          }
          return successResponse;
        });

        unawaited(interceptor.onError(err, handler));

        // Tras backoff #1 (500ms): primer fetch que retorna 429 (via throw).
        async
          ..elapse(const Duration(milliseconds: 500))
          ..flushMicrotasks();
        expect(fetchCallCount, 1);

        // El catch del onError llama handler.next(e), que en producción
        // re-entra al interceptor. En tests con mock handler, eso NO re-entra,
        // así que el segundo retry no se dispara automáticamente.
        // Verificamos que el primer fetch ocurrió y que handler.next recibió
        // el DioException 429 (no resolved, ni exhausted).
        verify(() => dio.fetch<dynamic>(any())).called(1);
        final captured = verify(() => handler.next(captureAny())).captured;
        expect(captured.length, 1);
        expect(captured.single, isA<DioException>());
        expect((captured.single as DioException).response?.statusCode, 429);
        verifyNever(() => handler.resolve(any()));
      });
    });

    test('429 persistente: tras maxRetries, propaga DioRetriesExhaustedException',
        () {
      fakeAsync((async) {
        final reqOptions = RequestOptions(
          path: '/test',
          extra: <String, dynamic>{
            'http_provider.retryAttempt': 2, // ya hizo maxRetries retries
          },
        );
        final err = DioException(
          requestOptions: reqOptions,
          response: Response<dynamic>(
            requestOptions: reqOptions,
            statusCode: 429,
          ),
          type: DioExceptionType.badResponse,
        );

        unawaited(interceptor.onError(err, handler));
        async.flushMicrotasks();

        verifyNever(() => dio.fetch<dynamic>(any()));
        final captured = verify(() => handler.next(captureAny())).captured;
        expect(captured.length, 1);
        expect(captured.single, isA<DioRetriesExhaustedException>());
      });
    });

    test('requests concurrentes no comparten counter', () {
      fakeAsync((async) {
        final reqOptionsA = RequestOptions(path: '/a');
        final reqOptionsB = RequestOptions(path: '/b');

        final errA = DioException(
          requestOptions: reqOptionsA,
          response: Response<dynamic>(
            requestOptions: reqOptionsA,
            statusCode: 429,
          ),
          type: DioExceptionType.badResponse,
        );
        final errB = DioException(
          requestOptions: reqOptionsB,
          response: Response<dynamic>(
            requestOptions: reqOptionsB,
            statusCode: 429,
          ),
          type: DioExceptionType.badResponse,
        );

        when(() => dio.fetch<dynamic>(any())).thenAnswer(
          (invocation) async => Response<dynamic>(
            requestOptions:
                invocation.positionalArguments.first as RequestOptions,
            statusCode: 200,
          ),
        );

        unawaited(interceptor.onError(errA, handler));
        unawaited(interceptor.onError(errB, handler));
        async
          ..elapse(const Duration(milliseconds: 500))
          ..flushMicrotasks();

        expect(reqOptionsA.extra['http_provider.retryAttempt'], 1);
        expect(reqOptionsB.extra['http_provider.retryAttempt'], 1);
      });
    });
  });
}
