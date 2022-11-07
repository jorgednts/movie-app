// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_details_cache.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieDetailsCacheAdapter extends TypeAdapter<MovieDetailsCache> {
  @override
  final int typeId = 2;

  @override
  MovieDetailsCache read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieDetailsCache(
      adult: fields[0] as bool,
      budget: fields[1] as int,
      genres: (fields[2] as List).cast<String>(),
      id: fields[3] as int,
      originalLanguage: fields[4] as String,
      originalTitle: fields[5] as String,
      overview: fields[6] as String,
      posterUrl: fields[7] as String,
      productionCompanies: (fields[8] as List).cast<ProductionCompaniesCache>(),
      releaseDate: fields[9] as String,
      revenue: fields[10] as int,
      runtime: fields[11] as int,
      spokenLanguages: (fields[12] as List).cast<String>(),
      status: fields[13] as String,
      title: fields[14] as String,
      voteAverage: fields[15] as double,
    );
  }

  @override
  void write(BinaryWriter writer, MovieDetailsCache obj) {
    writer
      ..writeByte(16)
      ..writeByte(0)
      ..write(obj.adult)
      ..writeByte(1)
      ..write(obj.budget)
      ..writeByte(2)
      ..write(obj.genres)
      ..writeByte(3)
      ..write(obj.id)
      ..writeByte(4)
      ..write(obj.originalLanguage)
      ..writeByte(5)
      ..write(obj.originalTitle)
      ..writeByte(6)
      ..write(obj.overview)
      ..writeByte(7)
      ..write(obj.posterUrl)
      ..writeByte(8)
      ..write(obj.productionCompanies)
      ..writeByte(9)
      ..write(obj.releaseDate)
      ..writeByte(10)
      ..write(obj.revenue)
      ..writeByte(11)
      ..write(obj.runtime)
      ..writeByte(12)
      ..write(obj.spokenLanguages)
      ..writeByte(13)
      ..write(obj.status)
      ..writeByte(14)
      ..write(obj.title)
      ..writeByte(15)
      ..write(obj.voteAverage);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieDetailsCacheAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
