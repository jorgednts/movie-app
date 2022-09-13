import 'package:json_annotation/json_annotation.dart';

part 'spoken_languages_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class SpokenLanguagesResponse {
  SpokenLanguagesResponse({
    this.name,
  });

  factory SpokenLanguagesResponse.fromJson(Map<String, dynamic> json) =>
      _$SpokenLanguagesResponseFromJson(json);

  final String? name;

  Map<String, dynamic> toJson() => _$SpokenLanguagesResponseToJson(this);
}
