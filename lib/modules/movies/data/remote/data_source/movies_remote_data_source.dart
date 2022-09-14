import '../../../domain/model/details/movie_details_model.dart';
import '../../../domain/model/movie/movie_model.dart';

abstract class MoviesRemoteDataSource {
  Future<List<MovieModel>> getMoviesList();

  Future<MovieDetailsModel> getMovieDetails(int id);
}
