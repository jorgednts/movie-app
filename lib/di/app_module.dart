import 'package:flutter_modular/flutter_modular.dart';
import 'package:movie_app/modules/movies/module/movies_module.dart';
import '../modules/common/app_constant_routes.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(AppConstantsRoutes.moviesModule, module: MoviesModule()),
      ];
}
