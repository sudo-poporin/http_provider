import 'package:http_provider/http_provider.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class _MockRequestHandler extends Mock implements RequestInterceptorHandler {}

class _MockResponseHandler extends Mock
    implements ResponseInterceptorHandler {}

class _MockErrorHandler extends Mock implements ErrorInterceptorHandler {}

void main() {
  group('LoggerOptions', () {
    test('defaults: compacto, sink print, headers sensibles redactados', () {
      const options = LoggerOptions();

      expect(options.logHeaders, isFalse);
      expect(options.logBody, isFalse);
      expect(options.logPrint, print);
      expect(
        options.redactedHeaders,
        {'authorization', 'cookie', 'set-cookie'},
      );
    });
  });

  group('LoggerInterceptor.onRequest', () {
    late List<String> logs;
    late RequestInterceptorHandler handler;

    setUp(() {
      logs = <String>[];
      handler = _MockRequestHandler();
    });

    test('loguea método y uri, guarda timestamp, llama handler.next', () {
      final interceptor = LoggerInterceptor(
        options: LoggerOptions(logPrint: logs.add),
      );
      final request = RequestOptions(
        path: 'https://api.x.com/users',
        queryParameters: {'page': 1},
      );

      interceptor.onRequest(request, handler);

      expect(logs, ['🚀 GET https://api.x.com/users?page=1']);
      expect(request.extra['http_provider.loggerStart'], isA<DateTime>());
      verify(() => handler.next(request)).called(1);
    });
  });
}
