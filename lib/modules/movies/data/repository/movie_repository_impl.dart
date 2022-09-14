import '../../domain/model/details/movie_details_model.dart';
import '../../domain/model/movie/movie_model.dart';
import '../../domain/repository/movie_repository.dart';
import '../remote/data_source/movies_remote_data_source.dart';

class MovieRepositoryImpl implements MovieRepository {
  MovieRepositoryImpl({required MoviesRemoteDataSource moviesRemoteDataSource})
      : _moviesRemoteDataSource = moviesRemoteDataSource;

  final MoviesRemoteDataSource _moviesRemoteDataSource;

  @override
  Future<List<MovieModel>> getMovieList() async {
    final movieList = await _moviesRemoteDataSource.getMoviesList();
    return movieList;
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(int id) async {
    final movieDetail = await _moviesRemoteDataSource.getMovieDetails(id);
    return movieDetail;
  }
}
