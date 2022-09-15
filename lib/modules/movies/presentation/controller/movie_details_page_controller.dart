import 'package:flutter/material.dart';

import '../../domain/exception/generic_error_status_code_exception.dart';
import '../../domain/exception/network_error_exception.dart';
import '../../domain/model/details/movie_details_model.dart';
import '../../domain/use_case/get_movie_details_use_case.dart';
import '../page/movie_details_page_state.dart';

class MovieDetailsPageController extends ValueNotifier<MovieDetailsPageState> {
  MovieDetailsPageController(
      {required GetMovieDetailsUseCase getMovieDetailsUseCase})
      : _getMovieDetailsUseCase = getMovieDetailsUseCase,
        super(MovieDetailsPageState.loading);

  final GetMovieDetailsUseCase _getMovieDetailsUseCase;

  MovieDetailsModel? movie;

  Future<void> getMovieDetails(int id) async {
    value = MovieDetailsPageState.loading;
    try {
      movie = await _getMovieDetailsUseCase.call(id);
      value = MovieDetailsPageState.success;
    } on GenericErrorStatusCodeException {
      value = MovieDetailsPageState.genericError;
    } on NetworkErrorException {
      value = MovieDetailsPageState.networkError;
    } catch (e) {
      value = MovieDetailsPageState.genericError;
    }
  }
}
