import 'package:flutter_modular/flutter_modular.dart';

import '../modules/common/app_constant_routes.dart';
import '../modules/movies/module/movies_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(AppConstantsRoutes.moviesModule, module: MoviesModule()),
      ];
}
