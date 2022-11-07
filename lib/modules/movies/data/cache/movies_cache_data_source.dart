import 'package:movie_app/modules/movies/domain/model/details/movie_details_model.dart';
import 'package:movie_app/modules/movies/domain/model/movie/movie_model.dart';

abstract class MoviesCacheDataSource {
  Future<void> saveMovieList(List<MovieModel> movieList);

  Future<List<MovieModel>> getMovieList();

  Future<void> saveMovieDetails(MovieDetailsModel movieDetails);

  Future<MovieDetailsModel> getMovieDetails(int id);
}