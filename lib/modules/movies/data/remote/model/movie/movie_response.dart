import 'package:json_annotation/json_annotation.dart';

part 'movie_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class MovieResponse {
  MovieResponse({
    this.id,
    this.voteAverage,
    this.title,
    this.posterUrl,
    this.genres,
    this.releaseDate,
  });

  factory MovieResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieResponseFromJson(json);

  int? id;
  double? voteAverage;
  String? title;
  String? posterUrl;
  List<String>? genres;
  String? releaseDate;

  Map<String, dynamic> toJson() => _$MovieResponseToJson(this);
}
