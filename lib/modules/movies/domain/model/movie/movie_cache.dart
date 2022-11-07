import 'package:hive/hive.dart';

part 'movie_cache.g.dart';

@HiveType(typeId: 0)
class MovieCache {
  MovieCache({
    required this.id,
    required this.voteAverage,
    required this.title,
    required this.posterUrl,
    required this.genres,
    required this.releaseDate,
  });
  @HiveField(0)
  final int id;
  @HiveField(1)
  final double voteAverage;
  @HiveField(2)
  final String title;
  @HiveField(3)
  final String posterUrl;
  @HiveField(4)
  final List<String> genres;
  @HiveField(5)
  final String releaseDate;
}