import 'package:http_provider/http_provider.dart';
import 'package:http_provider/src/mixins/dio_error_handler_mixin.dart';
import 'package:test/test.dart';

class _TestHandler with DioErrorHandler {
  NetworkException call(Exception e) => manageNetworkException(e);
}

void main() {
  group('DioErrorHandler', () {
    final handler = _TestHandler();

    test(
      'mapea DioRetriesExhaustedException a NetworkException.retriesExhausted',
      () {
        final source = DioException(
          requestOptions: RequestOptions(path: '/test'),
          response: Response<dynamic>(
            requestOptions: RequestOptions(path: '/test'),
            statusCode: 429,
          ),
          type: DioExceptionType.badResponse,
        );
        final exhausted = DioRetriesExhaustedException(source);

        final result = handler(exhausted);

        expect(result, isA<RetriesExhausted>());
      },
    );
  });
}
