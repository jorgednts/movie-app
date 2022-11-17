import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/modules/movies/domain/model/details/movie_details_model.dart';
import 'package:movie_app/modules/movies/domain/model/details/production_companies_model.dart';
import 'package:movie_app/modules/movies/domain/repository/movie_repository.dart';
import 'package:movie_app/modules/movies/domain/use_case/get_movie_details_use_case.dart';

import 'get_movie_details_use_case_impl_test.mocks.dart';

@GenerateMocks([MovieRepository])
void main() {
  late MockMovieRepository mockMovieRepository;
  late GetMovieDetailsUseCaseImpl getMovieDetailsUseCaseImpl;

  setUpAll(() {
    mockMovieRepository = MockMovieRepository();
    getMovieDetailsUseCaseImpl =
        GetMovieDetailsUseCaseImpl(movieRepository: mockMovieRepository);
  });
  setUp(() => reset(mockMovieRepository));
  group('GIVEN a call on call', () {
    test(
        'WHEN request is successful'
        'THEN it should return a MovieDetailsModel', () async {
      when(mockMovieRepository.getMovieDetails(19404))
          .thenAnswer((_) async => _getSuccessfulMovieDetailsModelMock());
      final movieDetails = await getMovieDetailsUseCaseImpl.call(19404);
      final movieDetailsExpected = _getSuccessfulMovieDetailsModelMock();
      expect(movieDetails, movieDetailsExpected);
      verify(mockMovieRepository.getMovieDetails(19404)).called(1);
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
