import 'production_companies_model.dart';
import 'spoken_languages_model.dart';

class MovieDetailsModel {
  MovieDetailsModel({
    required this.adult,
    required this.backdropUrl,
    required this.budget,
    required this.genres,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.posterUrl,
    required this.productionCompanies,
    required this.releaseDate,
    required this.revenue,
    required this.runtime,
    required this.spokenLanguages,
    required this.status,
    required this.title,
    required this.voteAverage,
  });

  final bool adult;
  final String backdropUrl;
  final int budget;
  final List<String> genres;
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final String posterUrl;
  final List<ProductionCompaniesModel> productionCompanies;
  final String releaseDate;
  final int revenue;
  final int runtime;
  final List<SpokenLanguagesModel> spokenLanguages;
  final String status;
  final String title;
  final double voteAverage;
}
