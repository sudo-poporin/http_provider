# HTTP Provider 📡

Paquete para obtener información de forma remota.

## Instalación 💻

Instalar a través del archivo `pubspec.yaml` añadiendo la dependencia:

```yaml
dependencies:
  http_provider:
    git:
      url: https://github.com/sudo-poporin/http_provider
      ref: main
```

---

## Uso 📖

Este paquete proporciona una interfaz para interactuar con servicios web RESTful utilizando HTTP. Permite realizar solicitudes GET y POST de manera sencilla.

Internamente, utiliza la biblioteca [Dio](https://pub.dev/packages/dio) para manejar las solicitudes HTTP y las respuestas.

También implementa un manejo de errores robusto a través de excepciones personalizadas y respuestas encapsuladas siguiendo el patrón Either de la biblioteca [fpdart](https://pub.dev/packages/fpdart).

### Ejemplo de uso

```dart
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

    responseEither.fold(
      (error) => 'Error: $error',
      (response) => 'Response: ${response.data}',
    );
}
```
