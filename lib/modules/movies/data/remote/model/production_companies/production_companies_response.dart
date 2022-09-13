import 'package:json_annotation/json_annotation.dart';

part 'production_companies_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ProductionCompaniesResponse {
  ProductionCompaniesResponse({
    this.id,
    this.logoUrl,
    this.name,
    this.originCountry,
  });

  factory ProductionCompaniesResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductionCompaniesResponseFromJson(json);

  final int? id;
  final String? logoUrl;
  final String? name;
  final String? originCountry;

  Map<String, dynamic> toJson() => _$ProductionCompaniesResponseToJson(this);
}
