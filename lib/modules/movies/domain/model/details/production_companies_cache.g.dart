// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'production_companies_cache.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductionCompaniesCacheAdapter
    extends TypeAdapter<ProductionCompaniesCache> {
  @override
  final int typeId = 1;

  @override
  ProductionCompaniesCache read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductionCompaniesCache(
      id: fields[0] as int,
      logoUrl: fields[1] as String,
      name: fields[2] as String,
      originCountry: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ProductionCompaniesCache obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.logoUrl)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.originCountry);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductionCompaniesCacheAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
