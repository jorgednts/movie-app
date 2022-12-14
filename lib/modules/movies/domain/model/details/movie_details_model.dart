import 'package:equatable/equatable.dart';

import 'production_companies_model.dart';

class MovieDetailsModel extends Equatable {
  const MovieDetailsModel({
    required this.adult,
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
  final List<String> spokenLanguages;
  final String status;
  final String title;
  final double voteAverage;

  @override
  List<Object?> get props => [
        adult,
        budget,
        genres,
        id,
        originalLanguage,
        originalTitle,
        overview,
        posterUrl,
        productionCompanies,
        releaseDate,
        revenue,
        runtime,
        spokenLanguages,
        status,
        title,
        voteAverage,
      ];
}
