import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_dio/services/dio_client.dart';
import 'package:teste_dio/services/http_client_interface.dart';
import 'package:teste_dio/views/home_page.dart';

import 'controllers/home_controller.dart';
import 'services/json_placeholder_service.dart';

class AppModule extends Module {
  /* final controller =
      HomeController(JsonPlaceholderService(HttpPackageClient())); */
  @override
  List<Bind> get binds => [
        /* Bind.singleton<HttpClientInterface>((i) => HttpPackageClient()), */
        Bind.singleton<HttpClientInterface>((i) => DioClient()),
        Bind.singleton((i) => JsonPlaceholderService(i())),
        Bind.singleton((i) => HomeController(i())),
      ];

  @override
  // TODO: implement routes
  List<ModularRoute> get routes => [
        ChildRoute('/${HomePage.id}', child: ((_, __) => const HomePage())),
      ];
}
