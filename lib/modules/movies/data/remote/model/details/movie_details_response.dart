import 'package:json_annotation/json_annotation.dart';

import '../production_companies/production_companies_response.dart';
import '../spoken_languages/spoken_languages_response.dart';

part 'movie_details_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class MovieDetailsResponse {
  MovieDetailsResponse({
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

  factory MovieDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailsResponseFromJson(json);

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

  Map<String, dynamic> toJson() => _$MovieDetailsResponseToJson(this);
}
