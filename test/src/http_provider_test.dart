import 'package:fpdart/fpdart.dart';
import 'package:http_provider/http_provider.dart';
import 'package:test/test.dart';

void main() {
  group('Service: HTTP provider', () {
    late HTTPProvider httpProvider;

    setUp(() {
      httpProvider = HTTPProvider();
    });

    test('debe crear una instancia de HTTPProvider', () {
      expect(httpProvider, isA<HTTPProvider>());
    });

    group('.post()', () {
      test(
        'debe devolver un objeto Response si la solicitud es exitosa',
        () async {
          final responseEither = await httpProvider.post<Response<dynamic>>(
            'https://reqbin.com/echo/post/json',
            data: {'test': 'test'},
          );

          final response =
              (responseEither as Right<NetworkException, Response<dynamic>>)
                  .value;

          expect(response, isA<Response<dynamic>>());
          expect(response.data, isA<Map<String, dynamic>>());
        },
      );

      group('Errores con código de estado', () {
        test('debe lanzar una excepción si la solicitud falla', () async {
          final responseEither = await httpProvider.post<Response<dynamic>>(
            'https://httpbin.org/status/400',
            data: {'test': 'test'},
          );

          expect(
            responseEither,
            isA<Left<NetworkException, Response<dynamic>>>(),
          );
        });

        test('debe lanzar una excepción si la solicitud excede el tiempo de '
            'espera', () async {
          final responseEither = await httpProvider.post<Response<dynamic>>(
            'https://httpbin.org/delay/0.1',
            options: Options(receiveTimeout: const Duration(milliseconds: 1)),
          );

          expect(
            responseEither,
            isA<Left<NetworkException, Response<dynamic>>>(),
          );
        });
      });
    });

    group('.get()', () {
      test(
        'debe devolver un objeto Response si la solicitud es exitosa',
        () async {
          final responseEither = await httpProvider.get<Response<dynamic>>(
            'https://reqbin.com/echo',
          );

          final response =
              (responseEither as Right<NetworkException, Response<dynamic>>)
                  .value;

          expect(response, isA<Response<dynamic>>());
          expect(response.data, isA<String>());
        },
      );

      group('Errores con código de estado', () {
        test('debe lanzar una excepción si la solicitud falla', () async {
          final responseEither = await httpProvider.get<Response<dynamic>>(
            'https://httpbin.org/status/400',
          );

          expect(
            responseEither,
            isA<Left<NetworkException, Response<dynamic>>>(),
          );
        });

        test('debe lanzar una excepción si la solicitud excede el tiempo de '
            'espera', () async {
          final responseEither = await httpProvider.get<Response<dynamic>>(
            'https://httpbin.org/delay/0.1',
            options: Options(receiveTimeout: const Duration(milliseconds: 1)),
          );

          expect(
            responseEither,
            isA<Left<NetworkException, Response<dynamic>>>(),
          );
        });
      });
    });
  });
}
