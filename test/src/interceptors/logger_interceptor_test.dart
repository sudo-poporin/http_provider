import 'package:http_provider/http_provider.dart';
import 'package:test/test.dart';

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
}
