import 'dart:developer';

import 'package:http_provider/http_provider.dart';

Future<void> main() async {
  final httpProvider = HTTPProvider();

  const path = 'https://pokeapi.co/api/v2/pokemon/porygon2';
  final headers = {
    'Content-Type': 'application/json',
  };

  final responseEither = await httpProvider.get<Response<dynamic>>(
    path,
    options: Options(headers: headers),
  );

  log(
    responseEither.fold(
      (error) => 'Error: $error',
      (response) => 'Response: ${response.data}',
    ),
  );
}
