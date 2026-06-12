import 'package:http_provider/http_provider.dart';

Future<void> main() async {
  final httpProvider = HTTPProvider(
    enableLogger: true,
  );

  const path = 'https://pokeapi.co/api/v2/pokemon/porygon2';
  final headers = {
    'Content-Type': 'application/json',
  };

  await httpProvider.get<Response<dynamic>>(
    path,
    options: Options(headers: headers),
  );
}
