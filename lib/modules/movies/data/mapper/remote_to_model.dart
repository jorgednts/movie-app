import '../../constants/null_responses_constants.dart';
import '../../domain/model/details/movie_details_model.dart';
import '../../domain/model/details/production_companies_model.dart';
import '../../domain/model/movie/movie_model.dart';
import '../remote/model/details/movie_details_response.dart';
import '../remote/model/movie/movie_response.dart';

extension MovieListResponseToMovieListModel on List<MovieResponse> {
  List<MovieModel> toMovieListModel() => map((movieResponse) => MovieModel(
        id: movieResponse.id ?? NullResponseConstants.nullIntResponse,
        voteAverage: movieResponse.voteAverage ??
            NullResponseConstants.nullDoubleResponse,
        title: movieResponse.title ?? NullResponseConstants.nullStringResponse,
        posterUrl:
            movieResponse.posterUrl ?? NullResponseConstants.nullStringResponse,
        genres: movieResponse.genres ?? [],
        releaseDate: movieResponse.releaseDate ??
            NullResponseConstants.nullStringResponse,
      )).toList();
}

extension MovieDetailsResponseToMovieDetailsModel on MovieDetailsResponse {
  MovieDetailsModel toMovieDetailsModel() => MovieDetailsModel(
        adult: adult ?? NullResponseConstants.nullBoolResponse,
        backdropUrl: backdropUrl ?? NullResponseConstants.nullStringResponse,
        budget: budget ?? NullResponseConstants.nullIntResponse,
        genres: genres ?? [],
        id: id ?? NullResponseConstants.nullIntResponse,
        originalLanguage:
            originalLanguage ?? NullResponseConstants.nullStringResponse,
        originalTitle:
            originalTitle ?? NullResponseConstants.nullStringResponse,
        overview: overview ?? NullResponseConstants.nullStringResponse,
        posterUrl: posterUrl ?? NullResponseConstants.nullStringResponse,
        productionCompanies: productionCompanies
                ?.map(
                  (company) => ProductionCompaniesModel(
                      id: company.id ?? NullResponseConstants.nullIntResponse,
                      logoUrl: company.logoUrl ??
                          NullResponseConstants.nullStringResponse,
                      name: company.name ??
                          NullResponseConstants.nullStringResponse,
                      originCountry: company.originCountry ??
                          NullResponseConstants.nullStringResponse),
                )
                .toList() ??
            [],
        releaseDate: releaseDate ?? NullResponseConstants.nullStringResponse,
        revenue: revenue ?? NullResponseConstants.nullIntResponse,
        runtime: runtime ?? NullResponseConstants.nullIntResponse,
        spokenLanguages: spokenLanguages
                ?.map((spokenLanguages) =>
                    spokenLanguages.name ??
                    NullResponseConstants.nullStringResponse)
                .toList() ??
            [],
        status: status ?? NullResponseConstants.nullStringResponse,
        title: title ?? NullResponseConstants.nullStringResponse,
        voteAverage: voteAverage ?? NullResponseConstants.nullDoubleResponse,
      );
}
