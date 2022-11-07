import '../../domain/model/details/movie_details_cache.dart';
import '../../domain/model/details/movie_details_model.dart';
import '../../domain/model/details/production_companies_model.dart';
import '../../domain/model/movie/movie_cache.dart';
import '../../domain/model/movie/movie_model.dart';

extension MovieListCacheToMovieListModel on List<MovieCache> {
  List<MovieModel> toMovieListModel() => map((movieResponse) => MovieModel(
        id: movieResponse.id,
        voteAverage: movieResponse.voteAverage,
        title: movieResponse.title,
        posterUrl: movieResponse.posterUrl,
        genres: movieResponse.genres,
        releaseDate: movieResponse.releaseDate,
      )).toList();
}

extension MovieDetailsCacheToMovieDetailsModel on MovieDetailsCache {
  MovieDetailsModel toMovieDetailsModel() => MovieDetailsModel(
        adult: adult,
        budget: budget,
        genres: genres,
        id: id,
        originalLanguage: originalLanguage,
        originalTitle: originalTitle,
        overview: overview,
        posterUrl: posterUrl,
        productionCompanies: productionCompanies
            .map(
              (company) => ProductionCompaniesModel(
                  id: company.id,
                  logoUrl: company.logoUrl,
                  name: company.name,
                  originCountry: company.originCountry),
            )
            .toList(),
        releaseDate: releaseDate,
        revenue: revenue,
        runtime: runtime,
        spokenLanguages: spokenLanguages,
        status: status,
        title: title,
        voteAverage: voteAverage,
      );
}
