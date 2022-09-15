// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDetailsResponse _$MovieDetailsResponseFromJson(
        Map<String, dynamic> json) =>
    MovieDetailsResponse(
      adult: json['adult'] as bool?,
      budget: json['budget'] as int?,
      genres:
          (json['genres'] as List<dynamic>?)?.map((e) => e as String).toList(),
      id: json['id'] as int?,
      originalLanguage: json['original_language'] as String?,
      originalTitle: json['original_title'] as String?,
      overview: json['overview'] as String?,
      posterUrl: json['poster_url'] as String?,
      productionCompanies: (json['production_companies'] as List<dynamic>?)
          ?.map((e) =>
              ProductionCompaniesResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      releaseDate: json['release_date'] as String?,
      revenue: json['revenue'] as int?,
      runtime: json['runtime'] as int?,
      spokenLanguages: (json['spoken_languages'] as List<dynamic>?)
          ?.map((e) =>
              SpokenLanguagesResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String?,
      title: json['title'] as String?,
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$MovieDetailsResponseToJson(
        MovieDetailsResponse instance) =>
    <String, dynamic>{
      'adult': instance.adult,
      'budget': instance.budget,
      'genres': instance.genres,
      'id': instance.id,
      'original_language': instance.originalLanguage,
      'original_title': instance.originalTitle,
      'overview': instance.overview,
      'poster_url': instance.posterUrl,
      'production_companies': instance.productionCompanies,
      'release_date': instance.releaseDate,
      'revenue': instance.revenue,
      'runtime': instance.runtime,
      'spoken_languages': instance.spokenLanguages,
      'status': instance.status,
      'title': instance.title,
      'vote_average': instance.voteAverage,
    };
