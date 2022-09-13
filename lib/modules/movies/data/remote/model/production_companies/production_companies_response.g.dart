// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'production_companies_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductionCompaniesResponse _$ProductionCompaniesResponseFromJson(
        Map<String, dynamic> json) =>
    ProductionCompaniesResponse(
      id: json['id'] as int?,
      logoUrl: json['logo_url'] as String?,
      name: json['name'] as String?,
      originCountry: json['origin_country'] as String?,
    );

Map<String, dynamic> _$ProductionCompaniesResponseToJson(
        ProductionCompaniesResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'logo_url': instance.logoUrl,
      'name': instance.name,
      'origin_country': instance.originCountry,
    };
