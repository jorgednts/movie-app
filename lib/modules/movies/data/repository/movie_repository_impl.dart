import '../../domain/model/details/movie_details_model.dart';
import '../../domain/model/movie/movie_model.dart';
import '../../domain/repository/movie_repository.dart';
import '../cache/movies_cache_data_source.dart';
import '../remote/data_source/movies_remote_data_source.dart';

class MovieRepositoryImpl implements MovieRepository {
  MovieRepositoryImpl({
    required MoviesRemoteDataSource moviesRemoteDataSource,
    required MoviesCacheDataSource moviesCacheDataSource,
  })  : _moviesRemoteDataSource = moviesRemoteDataSource,
        _moviesCacheDataSource = moviesCacheDataSource;

  final MoviesRemoteDataSource _moviesRemoteDataSource;
  final MoviesCacheDataSource _moviesCacheDataSource;

  @override
  Future<List<MovieModel>> getMovieList() async {
    try {
      final movieList = await _moviesRemoteDataSource.getMoviesList();
      await _moviesCacheDataSource.saveMovieList(movieList);
      return await _moviesCacheDataSource.getMovieList();
    } catch (e) {
      return _moviesCacheDataSource.getMovieList();
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(int id) async {
    try {
      final movieDetail = await _moviesRemoteDataSource.getMovieDetails(id);
      await _moviesCacheDataSource.saveMovieDetails(movieDetail);
      return await _moviesCacheDataSource.getMovieDetails(id);
    } catch (e) {
      return _moviesCacheDataSource.getMovieDetails(id);
    }
  }
}
