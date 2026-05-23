import 'dart:async';

import 'package:fake_async/fake_async.dart';
import 'package:http_provider/http_provider.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class _MockDio extends Mock implements Dio {}

class _MockHandler extends Mock implements ErrorInterceptorHandler {}

class _FakeRequestOptions extends Fake implements RequestOptions {}

void main() {
  setUpAll(() {
    registerFallbackValue(_FakeRequestOptions());
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
  });
}
