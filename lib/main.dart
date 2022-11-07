import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'di/app_module.dart';
import 'generated/l10n.dart';
import 'modules/movies/domain/model/details/movie_details_cache.dart';
import 'modules/movies/domain/model/details/production_companies_cache.dart';
import 'modules/movies/domain/model/movie/movie_cache.dart';
import 'modules/movies/presentation/common/constants/movies_constant_colors.dart';
import 'modules/movies/presentation/common/constants/movies_constant_fonts.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Hive
    ..init((await getApplicationDocumentsDirectory()).path)
    ..registerAdapter<MovieCache>(MovieCacheAdapter())
    ..registerAdapter<MovieDetailsCache>(MovieDetailsCacheAdapter())
    ..registerAdapter<ProductionCompaniesCache>(
        ProductionCompaniesCacheAdapter());

  runApp(
    ModularApp(
      module: AppModule(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: MoviesConstantColors.primaryColor,
        fontFamily: MoviesConstantFonts.fredoka,
      ),
      debugShowCheckedModeBanner: false,
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales);
}
