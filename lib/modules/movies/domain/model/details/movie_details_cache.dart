import 'package:hive/hive.dart';

import 'production_companies_cache.dart';

part 'movie_details_cache.g.dart';

@HiveType(typeId: 2)
class MovieDetailsCache {
  MovieDetailsCache({
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

  @HiveField(0)
  final bool adult;
  @HiveField(1)
  final int budget;
  @HiveField(2)
  final List<String> genres;
  @HiveField(3)
  final int id;
  @HiveField(4)
  final String originalLanguage;
  @HiveField(5)
  final String originalTitle;
  @HiveField(6)
  final String overview;
  @HiveField(7)
  final String posterUrl;
  @HiveField(8)
  final List<ProductionCompaniesCache> productionCompanies;
  @HiveField(9)
  final String releaseDate;
  @HiveField(10)
  final int revenue;
  @HiveField(11)
  final int runtime;
  @HiveField(12)
  final List<String> spokenLanguages;
  @HiveField(13)
  final String status;
  @HiveField(14)
  final String title;
  @HiveField(15)
  final double voteAverage;
}
