import '../../domain/model/details/movie_details_cache.dart';
import '../../domain/model/details/movie_details_model.dart';
import '../../domain/model/details/production_companies_cache.dart';
import '../../domain/model/movie/movie_cache.dart';
import '../../domain/model/movie/movie_model.dart';

extension MovieListModelToMovieListCache on List<MovieModel> {
  List<MovieCache> toMovieListCache() => map((movieCache) => MovieCache(
        id: movieCache.id,
        voteAverage: movieCache.voteAverage,
        title: movieCache.title,
        posterUrl: movieCache.posterUrl,
        genres: movieCache.genres,
        releaseDate: movieCache.releaseDate,
      )).toList();
}

extension MovieDetailsModelToMovieDetailsCache on MovieDetailsModel {
  MovieDetailsCache toMovieDetailsCache() => MovieDetailsCache(
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
              (company) => ProductionCompaniesCache(
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
