import '../model/movie/movie_model.dart';
import '../repository/movie_repository.dart';

mixin GetMovieListUseCase {
  Future<List<MovieModel>> call();
}

class GetMovieListUseCaseImpl implements GetMovieListUseCase {
  GetMovieListUseCaseImpl({
    required MovieRepository movieRepository,
  }) : _movieRepository = movieRepository;

  final MovieRepository _movieRepository;

  @override
  Future<List<MovieModel>> call() async {
    final movieList = await _movieRepository.getMovieList();
    return movieList;
  }
}
