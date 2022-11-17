import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/modules/movies/data/cache/movies_cache_data_source.dart';
import 'package:movie_app/modules/movies/data/remote/data_source/movies_remote_data_source.dart';
import 'package:movie_app/modules/movies/data/repository/movie_repository_impl.dart';
import 'package:movie_app/modules/movies/domain/model/details/movie_details_model.dart';
import 'package:movie_app/modules/movies/domain/model/details/production_companies_model.dart';
import 'package:movie_app/modules/movies/domain/model/movie/movie_model.dart';

import 'movie_respository_impl_test.mocks.dart';

@GenerateMocks([MoviesRemoteDataSource, MoviesCacheDataSource])
void main() {
  late MockMoviesRemoteDataSource mockMoviesRemoteDataSource;
  late MockMoviesCacheDataSource mockMoviesCacheDataSource;
  late MovieRepositoryImpl movieRepositoryImpl;

  setUpAll(() {
    mockMoviesRemoteDataSource = MockMoviesRemoteDataSource();
    mockMoviesCacheDataSource = MockMoviesCacheDataSource();
    movieRepositoryImpl = MovieRepositoryImpl(
      moviesRemoteDataSource: mockMoviesRemoteDataSource,
      moviesCacheDataSource: mockMoviesCacheDataSource,
    );
  });
  setUp(() {
    reset(mockMoviesCacheDataSource);
    reset(mockMoviesRemoteDataSource);
  });
  group('GIVEN a call on getMovieList', () {
    test(
        'WHEN request is successful'
        'THEN it should return a list of MovieModel', () async {
      when(mockMoviesRemoteDataSource.getMoviesList())
          .thenAnswer((_) async => _getSuccessfulMovieListModelMock());
      when(mockMoviesCacheDataSource
              .saveMovieList(_getSuccessfulMovieListModelMock()))
          .thenAnswer((_) async => Null);
      when(mockMoviesCacheDataSource.getMovieList())
          .thenAnswer((_) async => _getSuccessfulMovieListModelMock());
      final movieModelList = await movieRepositoryImpl.getMovieList();
      final movieModelListExpected = _getSuccessfulMovieListModelMock();
      expect(movieModelList, movieModelListExpected);
      verify(mockMoviesRemoteDataSource.getMoviesList()).called(1);
    });
    test(
        'WHEN request fails'
        'THEN it should return a MovieModel from cache', () async {
      when(mockMoviesRemoteDataSource.getMoviesList()).thenThrow(Exception());
      when(mockMoviesCacheDataSource
              .saveMovieList(_getSuccessfulMovieListModelMock()))
          .thenAnswer((_) async => Null);
      when(mockMoviesCacheDataSource.getMovieList())
          .thenAnswer((_) async => _getSuccessfulMovieListModelMock());
      final movieCache = await movieRepositoryImpl.getMovieList();
      expect(movieCache, _getSuccessfulMovieListModelMock());
    });
  });
  group('GIVEN a call on getMovieDetails', () {
    test(
        'WHEN request is successful'
        'THEN it should return a MovieDetailsModel', () async {
      when(mockMoviesRemoteDataSource.getMovieDetails(19404))
          .thenAnswer((_) async => _getSuccessfulMovieDetailsModelMock());
      when(mockMoviesCacheDataSource
              .saveMovieDetails(_getSuccessfulMovieDetailsModelMock()))
          .thenAnswer((_) async => Null);
      when(mockMoviesCacheDataSource.getMovieDetails(19404))
          .thenAnswer((_) async => _getSuccessfulMovieDetailsModelMock());
      final movieDetailsModel =
          await movieRepositoryImpl.getMovieDetails(19404);
      final movieDetailsModelExpected = _getSuccessfulMovieDetailsModelMock();
      expect(movieDetailsModel, movieDetailsModelExpected);
      // verify(mockMoviesRemoteDataSource.getMoviesList());
      verify(mockMoviesCacheDataSource
          .saveMovieDetails(_getSuccessfulMovieDetailsModelMock()));
      verify(mockMoviesCacheDataSource.getMovieDetails(19404));
    });
    test(
        'WHEN request fails'
        'THEN it should return a MovieDetailsModel from cache', () async {
      when(mockMoviesRemoteDataSource.getMovieDetails(19404))
          .thenThrow(Exception());
      when(mockMoviesCacheDataSource
              .saveMovieDetails(_getSuccessfulMovieDetailsModelMock()))
          .thenAnswer((_) async => Null);
      when(mockMoviesCacheDataSource.getMovieDetails(19404))
          .thenAnswer((_) async => _getSuccessfulMovieDetailsModelMock());
      final movieDetailsCache =
          await movieRepositoryImpl.getMovieDetails(19404);
      final movieDetailsCacheExpected = _getSuccessfulMovieDetailsModelMock();
      expect(movieDetailsCache, movieDetailsCacheExpected);
    });
  });
}

MovieDetailsModel _getSuccessfulMovieDetailsModelMock() =>
    const MovieDetailsModel(
      adult: false,
      budget: 13200000,
      genres: ["Comedy", "Drama", "Romance"],
      id: 19404,
      originalLanguage: "hi",
      originalTitle: "दिलवाले दुल्हनिया ले जायेंगे",
      overview:
          "Raj is a rich, carefree, happy-go-lucky second generation NRI. Simran is the daughter of Chaudhary Baldev Singh, who in spite of being an NRI is very strict about adherence to Indian values. Simran has left for India to be married to her childhood fiancé. Raj leaves for India with a mission at his hands, to claim his lady love under the noses of her whole family. Thus begins a saga.",
      posterUrl:
          "https://image.tmdb.org/t/p/w200/2CAL2433ZeIihfX1Hb2139CX0pW.jpg",
      productionCompanies: [
        ProductionCompaniesModel(
            id: 1569,
            logoUrl:
                "https://image.tmdb.org/t/p/w200/5WSkzUe6OiyKlpX2hJUghLlWkiU.png",
            name: "Yash Raj Films",
            originCountry: "IN")
      ],
      releaseDate: "1995-10-20",
      revenue: 100000000,
      runtime: 190,
      spokenLanguages: ["हिन्दी"],
      status: "Released",
      title: "Dilwale Dulhania Le Jayenge",
      voteAverage: 9.3,
    );

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
