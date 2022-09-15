import 'package:flutter/material.dart';

import '../../domain/exception/generic_error_status_code_exception.dart';
import '../../domain/exception/network_error_exception.dart';
import '../../domain/model/movie/movie_model.dart';
import '../../domain/use_case/get_movie_list_use_case.dart';
import '../page/movie_list_page_state.dart';

class MovieListPageController extends ValueNotifier<MovieListPageState> {
  MovieListPageController(GetMovieListUseCase getMovieListUseCase)
      : _getMovieListUseCase = getMovieListUseCase,
        super(MovieListPageState.loading);

  final GetMovieListUseCase _getMovieListUseCase;

  List<MovieModel> movieList = List.empty(growable: true);

  Future<void> getMovieList() async {
    value = MovieListPageState.loading;
    try {
      final movies = await _getMovieListUseCase.call();
      movieList.addAll(movies);
      value = MovieListPageState.success;
    } on GenericErrorStatusCodeException {
      value = MovieListPageState.genericError;
    } on NetworkErrorException {
      value = MovieListPageState.networkError;
    } catch (e) {
      value = MovieListPageState.genericError;
    }
  }
}
