import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../data/remote/data_source/movies_remote_data_source.dart';
import '../../data/repository/movie_repository_impl.dart';
import '../../domain/repository/movie_repository.dart';
import '../../domain/use_case/get_movie_list_use_case.dart';
import '../../external/remote_data_source/movies_remote_data_source_impl.dart';
import '../../utils/context_extensions.dart';
import '../common/constants/movies_constant_colors.dart';
import '../common/widgets/circular_progress_indicator_widget.dart';
import '../common/widgets/movie_card_list_widget.dart';
import '../controller/movie_list_page_controller.dart';
import 'movie_list_page_state.dart';

class MovieListPage extends StatefulWidget {
  const MovieListPage({Key? key}) : super(key: key);

  @override
  State<MovieListPage> createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  late Dio dio;
  late MoviesRemoteDataSource moviesRemoteDataSource;
  late MovieRepository movieRepository;
  late GetMovieListUseCase getMovieListUseCase;
  late MovieListPageController controller;

  @override
  void initState() {
    super.initState();
    dio = Dio();
    moviesRemoteDataSource = MoviesRemoteDataSourceImpl(dio: dio);
    movieRepository =
        MovieRepositoryImpl(moviesRemoteDataSource: moviesRemoteDataSource);
    getMovieListUseCase = GetMovieListUseCaseImpl(movieRepository);
    controller = MovieListPageController(getMovieListUseCase);
    controller.getMovieList();
  }

  @override
  Widget build(BuildContext context) {
    context.setStatusBarColor(MoviesConstantColors.darkBlue);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MoviesConstantColors.primaryColor,
        title: const Text('TMDB'),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.center,
        child: ValueListenableBuilder<MovieListPageState>(
            valueListenable: controller,
            builder: (context, state, _) {
              switch (state) {
                case MovieListPageState.loading:
                  return const CircularProgressIndicatorWidget();
                case MovieListPageState.genericError:
                  return const Text('Erro');
                case MovieListPageState.networkError:
                  return const Text('Erro de Internet');
                case MovieListPageState.success:
                  return MovieCardListWidget(movieList: controller.movieList);
              }
            }),
      ),
    );
  }
}
