import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';

import '../constants/movies_constant_routes.dart';
import '../data/cache/movies_cache_data_source.dart';
import '../data/remote/data_source/movies_remote_data_source.dart';
import '../data/repository/movie_repository_impl.dart';
import '../domain/repository/movie_repository.dart';
import '../domain/use_case/get_movie_details_use_case.dart';
import '../domain/use_case/get_movie_list_use_case.dart';
import '../external/cache/movies_cache_data_source_impl.dart';
import '../external/remote_data_source/movies_remote_data_source_impl.dart';
import '../presentation/controller/movie_details_page_controller.dart';
import '../presentation/controller/movie_list_page_controller.dart';
import '../presentation/page/movie_details_page.dart';
import '../presentation/page/movie_list_page.dart';

class MoviesModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton((i) => Dio()),
        Bind.lazySingleton((i) => Hive),
        Bind.lazySingleton<MoviesRemoteDataSource>(
          (i) => MoviesRemoteDataSourceImpl(dio: i()),
        ),
        Bind.lazySingleton<MoviesCacheDataSource>(
            (i) => MoviesCacheDataSourceImpl(i())),
        Bind.lazySingleton<MovieRepository>(
          (i) => MovieRepositoryImpl(
            moviesRemoteDataSource: i(),
            moviesCacheDataSource: i(),
          ),
        ),
        Bind.lazySingleton<GetMovieListUseCase>(
          (i) => GetMovieListUseCaseImpl(movieRepository: i()),
        ),
        Bind.lazySingleton<GetMovieDetailsUseCase>(
          (i) => GetMovieDetailsUseCaseImpl(movieRepository: i()),
        ),
        Bind.factory<MovieListPageController>(
          (i) => MovieListPageController(getMovieListUseCase: i()),
        ),
        Bind.factory<MovieDetailsPageController>(
          (i) => MovieDetailsPageController(getMovieDetailsUseCase: i()),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          MoviesConstantsRoutes.movieListPage,
          child: (context, args) => const MovieListPage(),
        ),
        ChildRoute(
          MoviesConstantsRoutes.movieDetailsPage,
          child: (context, args) => MovieDetailsPage(id: args.data),
        ),
      ];
}
