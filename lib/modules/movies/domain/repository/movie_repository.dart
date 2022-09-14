import '../model/details/movie_details_model.dart';
import '../model/movie/movie_model.dart';

abstract class MovieRepository {
  Future<List<MovieModel>> getMovieList();

  Future<MovieDetailsModel> getMovieDetails(int id);
}
