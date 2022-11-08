import '../../domain/model/details/movie_details_model.dart';
import '../../domain/model/movie/movie_model.dart';

abstract class MoviesCacheDataSource {
  Future<void> saveMovieList(List<MovieModel> movieList);

  Future<List<MovieModel>> getMovieList();

  Future<void> saveMovieDetails(MovieDetailsModel movieDetails);

  Future<MovieDetailsModel> getMovieDetails(int id);
}
