// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieResponse _$MovieResponseFromJson(Map<String, dynamic> json) =>
    MovieResponse(
      id: json['id'] as int?,
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
      title: json['title'] as String?,
      posterUrl: json['poster_url'] as String?,
      genres:
          (json['genres'] as List<dynamic>?)?.map((e) => e as String).toList(),
      releaseDate: json['release_date'] as String?,
    );

Map<String, dynamic> _$MovieResponseToJson(MovieResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'vote_average': instance.voteAverage,
      'title': instance.title,
      'poster_url': instance.posterUrl,
      'genres': instance.genres,
      'release_date': instance.releaseDate,
    };
