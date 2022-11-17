import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/modules/movies/constants/movies_constants_url_api.dart';
import 'package:movie_app/modules/movies/domain/model/details/movie_details_model.dart';
import 'package:movie_app/modules/movies/domain/model/details/production_companies_model.dart';
import 'package:movie_app/modules/movies/domain/model/movie/movie_model.dart';
import 'package:movie_app/modules/movies/external/remote_data_source/movies_remote_data_source_impl.dart';

import '../../utils/json_extensions.dart';
import 'movies_remote_data_source_impl_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  late MockDio mockDio;
  late MoviesRemoteDataSourceImpl moviesRemoteDataSourceImpl;

  setUpAll(() {
    mockDio = MockDio();
    moviesRemoteDataSourceImpl = MoviesRemoteDataSourceImpl(dio: mockDio);
  });
  setUp(() {
    reset(mockDio);
  });
  group('GIVEN a call on getMoviesList', () {
    const getMoviesListSuccessResponsePath =
        'test_resources/get_movies_list_success_response.json';
    test('THEN verify if correct URL is called', () async {
      final json = await getMoviesListSuccessResponsePath.getJsonFromPath();
      when(mockDio.get(any))
          .thenAnswer((_) async => _getSuccessfulResponseMock(json));
      await moviesRemoteDataSourceImpl.getMoviesList();
      verify(
        mockDio.get(
          '${MoviesConstantsUrlApi.movieBaseUrl}movies-v2',
        ),
      ).called(1);
    });
    test(
        'WHEN request is successful'
        'THEN it should return a List of MovieModel', () async {
      final json = await getMoviesListSuccessResponsePath.getJsonFromPath();
      when(mockDio.get(any))
          .thenAnswer((_) async => _getSuccessfulResponseMock(json));
      final movieListModel = await moviesRemoteDataSourceImpl.getMoviesList();
      final movieListModelExpected = _getSuccessfulMovieListModelMock();
      expect(movieListModel, movieListModelExpected);
    });
  });
  group('GIVEN a call on getMovieDetails', () {
    const getMovieDetailsSuccessResponsePath =
        'test_resources/get_movie_details_successful_response.json';
    test('THEN verify if correct URL is called', () async {
      final json = await getMovieDetailsSuccessResponsePath.getJsonFromPath();
      when(mockDio.get(any))
          .thenAnswer((_) async => _getSuccessfulResponseMock(json));
      await moviesRemoteDataSourceImpl.getMovieDetails(19404);
      verify(mockDio
              .get('${MoviesConstantsUrlApi.movieBaseUrl}movies-v2/19404'))
          .called(1);
    });
    test(
        ' WHEN request is successfully'
        'THEN it should return a MovieDetailsModel', () async {
      final json = await getMovieDetailsSuccessResponsePath.getJsonFromPath();
      when(mockDio.get(any))
          .thenAnswer((_) async => _getSuccessfulResponseMock(json));
      final movieDetailsModel =
          await moviesRemoteDataSourceImpl.getMovieDetails(19404);
      final movieDetailsModelExpected = _getSuccessfulMovieDetailsModelMock();
      expect(movieDetailsModel, movieDetailsModelExpected);
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

Response<dynamic> _getSuccessfulResponseMock(json) => Response(
      data: json,
      statusCode: 200,
      requestOptions: RequestOptions(path: ''),
    );
