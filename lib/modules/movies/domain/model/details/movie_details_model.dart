import '../../../data/remote/model/production_companies/production_companies_response.dart';
import '../../../data/remote/model/spoken_languages/spoken_languages_response.dart';

class MovieDetailsModel {
  MovieDetailsModel({
    this.adult,
    this.backdropUrl,
    this.budget,
    this.genres,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.posterUrl,
    this.productionCompanies,
    this.releaseDate,
    this.revenue,
    this.runtime,
    this.spokenLanguages,
    this.status,
    this.title,
    this.voteAverage,
  });

  final bool? adult;
  final String? backdropUrl;
  final int? budget;
  final List<String>? genres;
  final int? id;
  final String? originalLanguage;
  final String? originalTitle;
  final String? overview;
  final String? posterUrl;
  final List<ProductionCompaniesResponse>? productionCompanies;
  final String? releaseDate;
  final int? revenue;
  final int? runtime;
  final List<SpokenLanguagesResponse>? spokenLanguages;
  final String? status;
  final String? title;
  final double? voteAverage;
}
