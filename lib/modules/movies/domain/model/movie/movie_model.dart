import 'package:equatable/equatable.dart';

class MovieModel extends Equatable {
  const MovieModel({
    required this.id,
    required this.voteAverage,
    required this.title,
    required this.posterUrl,
    required this.genres,
    required this.releaseDate,
  });

  final int id;
  final double voteAverage;
  final String title;
  final String posterUrl;
  final List<String> genres;
  final String releaseDate;

  @override
  List<Object?> get props => [
        id,
        voteAverage,
        title,
        posterUrl,
        genres,
        releaseDate,
      ];
}
