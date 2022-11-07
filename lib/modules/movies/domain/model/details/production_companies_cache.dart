import 'package:hive/hive.dart';

part 'production_companies_cache.g.dart';

@HiveType(typeId: 1)
class ProductionCompaniesCache {
  ProductionCompaniesCache({
    required this.id,
    required this.logoUrl,
    required this.name,
    required this.originCountry,
  });

  @HiveField(0)
  final int id;
  @HiveField(1)
  final String logoUrl;
  @HiveField(2)
  final String name;
  @HiveField(3)
  final String originCountry;
}
