import 'package:equatable/equatable.dart';

class ProductionCompaniesModel extends Equatable {
  const ProductionCompaniesModel({
    required this.id,
    required this.logoUrl,
    required this.name,
    required this.originCountry,
  });

  final int id;
  final String logoUrl;
  final String name;
  final String originCountry;

  @override
  List<Object?> get props => [
        id,
        logoUrl,
        name,
        originCountry,
      ];
}
