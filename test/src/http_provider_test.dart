import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:http_provider/http_provider.dart';
import 'package:http_provider/src/mixins/mixins.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class _MockDio extends Mock implements Dio {}

class _FakeOptions extends Fake implements Options {}

class _Handler with DioErrorHandler {}

void main() {
  setUpAll(() {
    registerFallbackValue(_FakeOptions());
  });

  group('HTTPProvider', () {
    late _MockDio dio;
    late HTTPProvider provider;
    late BaseOptions options;

    setUp(() {
      dio = _MockDio();
      options = BaseOptions();
      when(() => dio.options).thenReturn(options);
      provider = HTTPProvider(client: dio);
    });

    test('configura timeouts y headers en Dio.options', () {
      HTTPProvider(
        connectionTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 7),
        headers: const {'X-Test': '1'},
        client: dio,
      );

      expect(options.connectTimeout, const Duration(seconds: 5));
      expect(options.receiveTimeout, const Duration(seconds: 7));
      expect(options.headers, const {'X-Test': '1'});
    });

    test('crea Dio interno cuando no se inyecta client', () {
      final p = HTTPProvider();
      expect(p, isA<HTTPProvider>());
      p.close(force: true);
    });

    test('close delega en Dio.close', () {
      when(() => dio.close(force: any(named: 'force'))).thenReturn(null);

      provider.close(force: true);

      verify(() => dio.close(force: true)).called(1);
    });

    group('.get()', () {
      test('retorna Right cuando Dio responde correctamente', () async {
        final response = Response<dynamic>(
          requestOptions: RequestOptions(path: '/'),
          data: 'ok',
        );
        when(
          () => dio.get<dynamic>(
            any(),
            queryParameters: any(named: 'queryParameters'),
            options: any(named: 'options'),
          ),
        ).thenAnswer((_) async => response);

        final result = await provider.get<Response<dynamic>>('/path');

        expect(result, isA<Right<NetworkException, Response<dynamic>>>());
        expect((result as Right).value, response);
      });

      test('retorna Left si DioException', () async {
        when(
          () => dio.get<dynamic>(
            any(),
            queryParameters: any(named: 'queryParameters'),
            options: any(named: 'options'),
          ),
        ).thenThrow(
          DioException(
            requestOptions: RequestOptions(path: '/'),
            type: DioExceptionType.cancel,
          ),
        );

        final result = await provider.get<Response<dynamic>>('/path');

        expect((result as Left).value, isA<NetworkException>());
      });

      test(
        'retorna unableToProcess cuando el cast falla (TypeError)',
        () async {
          when(
            () => dio.get<dynamic>(
              any(),
              queryParameters: any(named: 'queryParameters'),
              options: any(named: 'options'),
            ),
          ).thenAnswer(
            (_) async =>
                Response<dynamic>(requestOptions: RequestOptions(path: '/')),
          );

          final result = await provider.get<String>('/path');

          result.fold(
            (e) => expect(e, isA<UnableToProcess>()),
            (_) => fail('debería ser Left'),
          );
        },
      );
    });

    group('.post()', () {
      test('retorna Right cuando Dio responde correctamente', () async {
        final response = Response<dynamic>(
          requestOptions: RequestOptions(path: '/'),
          data: {'ok': true},
        );
        when(
          () => dio.post<dynamic>(
            any(),
            data: any<dynamic>(named: 'data'),
            queryParameters: any(named: 'queryParameters'),
            options: any(named: 'options'),
          ),
        ).thenAnswer((_) async => response);

        final result = await provider.post<Response<dynamic>>(
          '/path',
          data: {'a': 1},
        );

        expect((result as Right).value, response);
      });

      test('retorna Left si DioException', () async {
        when(
          () => dio.post<dynamic>(
            any(),
            data: any<dynamic>(named: 'data'),
            queryParameters: any(named: 'queryParameters'),
            options: any(named: 'options'),
          ),
        ).thenThrow(
          DioException(
            requestOptions: RequestOptions(path: '/'),
            type: DioExceptionType.connectionError,
          ),
        );

        final result = await provider.post<Response<dynamic>>('/path');

        expect((result as Left).value, isA<NoInternetConnection>());
      });
    });
  });

  group('DioErrorHandler.manageNetworkException', () {
    final handler = _Handler();

    NetworkException run(Exception error) =>
        handler.manageNetworkException(error);

    DioException dioException({
      required DioExceptionType type,
      int? statusCode,
    }) {
      final requestOptions = RequestOptions(path: '/');
      return DioException(
        requestOptions: requestOptions,
        type: type,
        response: statusCode == null
            ? null
            : Response<dynamic>(
                requestOptions: requestOptions,
                statusCode: statusCode,
              ),
      );
    }

    test('mapea DioExceptionType.sendTimeout', () {
      expect(
        run(dioException(type: DioExceptionType.sendTimeout)),
        isA<SendTimeout>(),
      );
    });

    test('mapea DioExceptionType.connectionTimeout', () {
      expect(
        run(dioException(type: DioExceptionType.connectionTimeout)),
        isA<ConnectionTimeout>(),
      );
    });

    test('mapea DioExceptionType.receiveTimeout', () {
      expect(
        run(dioException(type: DioExceptionType.receiveTimeout)),
        isA<ReceiveTimeout>(),
      );
    });

    test('mapea DioExceptionType.connectionError', () {
      expect(
        run(dioException(type: DioExceptionType.connectionError)),
        isA<NoInternetConnection>(),
      );
    });

    test('mapea DioExceptionType.badCertificate', () {
      expect(
        run(dioException(type: DioExceptionType.badCertificate)),
        isA<BadCertificate>(),
      );
    });

    test('mapea DioExceptionType.cancel', () {
      expect(
        run(dioException(type: DioExceptionType.cancel)),
        isA<RequestCancelled>(),
      );
    });

    test('mapea DioExceptionType.unknown a defaultError', () {
      expect(
        run(dioException(type: DioExceptionType.unknown)),
        isA<DefaultError>(),
      );
    });

    group('badResponse status codes', () {
      final cases = <int, Type>{
        400: BadRequest,
        401: UnauthorisedRequest,
        403: Forbidden,
        404: NotFound,
        405: MethodNotAllowed,
        406: NotAcceptable,
        409: Conflict,
        429: TooManyRequests,
        500: InternalServerError,
        501: NotImplemented,
        503: ServiceUnavailable,
        418: DefaultError,
      };

      for (final entry in cases.entries) {
        test('${entry.key} → ${entry.value}', () {
          final result = run(
            dioException(
              type: DioExceptionType.badResponse,
              statusCode: entry.key,
            ),
          );
          expect(result.runtimeType, entry.value);
        });
      }

      test('null statusCode cae a defaultError', () {
        expect(
          run(dioException(type: DioExceptionType.badResponse)),
          isA<DefaultError>(),
        );
      });
    });

    test('SocketException mapea a noInternetConnection', () {
      expect(
        run(const SocketException('boom')),
        isA<NoInternetConnection>(),
      );
    });

    test('FormatException mapea a formatException', () {
      expect(run(const FormatException('bad')), isA<FormatException>());
    });

    test('Exception genérica mapea a unexpectedError', () {
      expect(run(Exception('oops')), isA<UnexpectedError>());
    });
  });
}
