import 'package:flutter_modular/flutter_modular.dart';

import 'modules/home/home_controller.dart';
import 'modules/home/home_page.dart';
import 'services/dio_repository.dart';
import 'services/data_source/http_client_interface.dart';
import 'modules/home/services/home_service.dart';

class AppModule extends Module {
  /* final controller =
      HomeController(JsonPlaceholderService(HttpPackageClient())); */
  @override
  List<Bind> get binds => [
        /* Bind.singleton<HttpClientInterface>((i) => HttpPackageClient()), */
        Bind.singleton<HttpClientInterface>((i) => DioRepository()),
        Bind.singleton((i) => HomeService(i())),
        Bind.singleton((i) => HomeController(i())),
      ];

  @override
  // TODO: implement routes
  List<ModularRoute> get routes => [
        ChildRoute('/${HomePage.id}', child: ((_, __) => const HomePage())),
      ];
}
