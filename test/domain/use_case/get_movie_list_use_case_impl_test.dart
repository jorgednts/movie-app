import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/modules/movies/domain/model/movie/movie_model.dart';
import 'package:movie_app/modules/movies/domain/repository/movie_repository.dart';
import 'package:movie_app/modules/movies/domain/use_case/get_movie_list_use_case.dart';

import 'get_movie_list_use_case_impl_test.mocks.dart';

@GenerateMocks([MovieRepository])
void main() {
  late MockMovieRepository mockMovieRepository;
  late GetMovieListUseCaseImpl getMovieListUseCaseImpl;

  setUpAll(() {
    mockMovieRepository = MockMovieRepository();
    getMovieListUseCaseImpl =
        GetMovieListUseCaseImpl(movieRepository: mockMovieRepository);
  });
  setUp(() => reset(mockMovieRepository));
  group('GIVEN a call on call', () {
    test(
        'WHEN request is successful'
        'THEN it should return a list of MovieModel', () async {
      when(mockMovieRepository.getMovieList())
          .thenAnswer((_) async => _getSuccessfulMovieListModelMock());
      final movieList = await getMovieListUseCaseImpl.call();
      final movieListExpected = _getSuccessfulMovieListModelMock();
      expect(movieList, movieListExpected);
      verify(mockMovieRepository.getMovieList()).called(1);
    });
  });
}

List<MovieModel> _getSuccessfulMovieListModelMock() => <MovieModel>[
      const MovieModel(
          id: 19404,
          voteAverage: 9.3,
          title: 'Dilwale Dulhania Le Jayenge',
          posterUrl:
              'https://image.tmdb.org/t/p/w200/2CAL2433ZeIihfX1Hb2139CX0pW.jpg',
          genres: ['Comedy', 'Drama', 'Romance'],
          releaseDate: '1995-10-20'),
      const MovieModel(
          id: 278,
          voteAverage: 8.6,
          title: 'The Shawshank Redemption',
          posterUrl:
              'https://image.tmdb.org/t/p/w200/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg',
          genres: ['Drama', 'Crime'],
          releaseDate: '1994-09-23'),
    ];
