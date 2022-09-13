class MovieModel {
  MovieModel({
    this.id,
    this.voteAverage,
    this.title,
    this.posterUrl,
    this.genres,
    this.releaseDate,
  });

  final int? id;
  final double? voteAverage;
  final String? title;
  final String? posterUrl;
  final List<String>? genres;
  final String? releaseDate;
}
