import '../model/details/movie_details_model.dart';
import '../repository/movie_repository.dart';

mixin GetMovieDetailsUseCase {
  Future<MovieDetailsModel> call(int id);
}

class GetMovieDetailsUseCaseImpl implements GetMovieDetailsUseCase {
  GetMovieDetailsUseCaseImpl(MovieRepository movieRepository)
      : _movieRepository = movieRepository;

  final MovieRepository _movieRepository;

  @override
  Future<MovieDetailsModel> call(int id) async {
    final movieDetails = await _movieRepository.getMovieDetails(id);
    return movieDetails;
  }
}
