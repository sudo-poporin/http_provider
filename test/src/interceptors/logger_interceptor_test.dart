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

  group('LoggerInterceptor.onError', () {
    late List<String> logs;
    late ErrorInterceptorHandler handler;
    late LoggerInterceptor interceptor;

    setUp(() {
      logs = <String>[];
      handler = _MockErrorHandler();
      interceptor = LoggerInterceptor(
        options: LoggerOptions(logPrint: logs.add),
      );
    });

    test('con response loguea status code; llama handler.next', () {
      final request = RequestOptions(path: 'https://api.x.com/users/99')
        ..extra['http_provider.loggerStart'] = DateTime.now();
      final err = DioException(
        requestOptions: request,
        response: Response<dynamic>(requestOptions: request, statusCode: 404),
        type: DioExceptionType.badResponse,
      );

      interceptor.onError(err, handler);

      expect(
        logs.single,
        matches(RegExp(r'^❌ 404 GET /users/99 \(\d+ms\)$')),
      );
      verify(() => handler.next(err)).called(1);
    });

    test('sin response loguea el DioExceptionType', () {
      final request = RequestOptions(path: 'https://api.x.com/users')
        ..extra['http_provider.loggerStart'] = DateTime.now();
      final err = DioException(
        requestOptions: request,
        type: DioExceptionType.connectionTimeout,
      );

      interceptor.onError(err, handler);

      expect(
        logs.single,
        matches(RegExp(r'^❌ connectionTimeout GET /users \(\d+ms\)$')),
      );
    });
  });

  group('LoggerInterceptor.onResponse', () {
    late List<String> logs;
    late ResponseInterceptorHandler handler;
    late LoggerInterceptor interceptor;

    setUp(() {
      logs = <String>[];
      handler = _MockResponseHandler();
      interceptor = LoggerInterceptor(
        options: LoggerOptions(logPrint: logs.add),
      );
    });

    test('loguea status, método, path y duración; llama handler.next', () {
      final request = RequestOptions(path: 'https://api.x.com/users')
        ..extra['http_provider.loggerStart'] = DateTime.now();
      final response = Response<dynamic>(
        requestOptions: request,
        statusCode: 200,
      );

      interceptor.onResponse(response, handler);

      expect(logs.single, matches(RegExp(r'^✅ 200 GET /users \(\d+ms\)$')));
      verify(() => handler.next(response)).called(1);
    });

    test('sin timestamp previo loguea 0ms', () {
      final request = RequestOptions(path: 'https://api.x.com/users');
      final response = Response<dynamic>(
        requestOptions: request,
        statusCode: 200,
      );

      interceptor.onResponse(response, handler);

      expect(logs.single, '✅ 200 GET /users (0ms)');
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

  group('LoggerInterceptor logHeaders', () {
    late List<String> logs;

    setUp(() {
      logs = <String>[];
    });

    test('onRequest redacta headers sensibles (case-insensitive)', () {
      final interceptor = LoggerInterceptor(
        options: LoggerOptions(logPrint: logs.add, logHeaders: true),
      );
      final request = RequestOptions(
        path: 'https://api.x.com/users',
        headers: {'Authorization': 'Bearer secreto', 'Accept': 'json'},
      );

      interceptor.onRequest(request, _MockRequestHandler());

      expect(logs, hasLength(2));
      expect(logs[1], '  headers: {Authorization: ***, Accept: json}');
    });

    test('onResponse loguea headers con redacción', () {
      final interceptor = LoggerInterceptor(
        options: LoggerOptions(logPrint: logs.add, logHeaders: true),
      );
      final request = RequestOptions(path: 'https://api.x.com/users');
      final response = Response<dynamic>(
        requestOptions: request,
        statusCode: 200,
        headers: Headers.fromMap({
          'set-cookie': ['session=abc'],
          'content-type': ['application/json'],
        }),
      );

      interceptor.onResponse(response, _MockResponseHandler());

      expect(logs, hasLength(2));
      expect(
        logs[1],
        '  headers: {set-cookie: ***, content-type: [application/json]}',
      );
    });

    test('redactedHeaders vacío muestra todo sin redactar', () {
      final interceptor = LoggerInterceptor(
        options: LoggerOptions(
          logPrint: logs.add,
          logHeaders: true,
          redactedHeaders: {},
        ),
      );
      final request = RequestOptions(
        path: 'https://api.x.com/users',
        headers: {'Authorization': 'Bearer secreto'},
      );

      interceptor.onRequest(request, _MockRequestHandler());

      expect(logs[1], '  headers: {Authorization: Bearer secreto}');
    });
  });

  group('LoggerInterceptor logBody', () {
    late List<String> logs;
    late LoggerInterceptor interceptor;

    setUp(() {
      logs = <String>[];
      interceptor = LoggerInterceptor(
        options: LoggerOptions(logPrint: logs.add, logBody: true),
      );
    });

    test('onRequest loguea body cuando hay data', () {
      final request = RequestOptions(
        path: 'https://api.x.com/login',
        method: 'POST',
        data: {'user': 'ana'},
      );

      interceptor.onRequest(request, _MockRequestHandler());

      expect(logs, hasLength(2));
      expect(logs[1], '  body: {user: ana}');
    });

    test('onRequest sin data no loguea línea de body', () {
      final request = RequestOptions(path: 'https://api.x.com/users');

      interceptor.onRequest(request, _MockRequestHandler());

      expect(logs, hasLength(1));
    });

    test('onResponse loguea body cuando hay data', () {
      final request = RequestOptions(path: 'https://api.x.com/login');
      final response = Response<dynamic>(
        requestOptions: request,
        statusCode: 200,
        data: {'token': 'abc'},
      );

      interceptor.onResponse(response, _MockResponseHandler());

      expect(logs, hasLength(2));
      expect(logs[1], '  body: {token: abc}');
    });

    test('onResponse sin data no loguea línea de body', () {
      final request = RequestOptions(path: 'https://api.x.com/users');
      final response = Response<dynamic>(
        requestOptions: request,
        statusCode: 204,
      );

      interceptor.onResponse(response, _MockResponseHandler());

      expect(logs, hasLength(1));
    });
  });
}
