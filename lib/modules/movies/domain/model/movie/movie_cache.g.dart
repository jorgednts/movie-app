// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_cache.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieCacheAdapter extends TypeAdapter<MovieCache> {
  @override
  final int typeId = 0;

  @override
  MovieCache read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieCache(
      id: fields[0] as int,
      voteAverage: fields[1] as double,
      title: fields[2] as String,
      posterUrl: fields[3] as String,
      genres: (fields[4] as List).cast<String>(),
      releaseDate: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MovieCache obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.voteAverage)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.posterUrl)
      ..writeByte(4)
      ..write(obj.genres)
      ..writeByte(5)
      ..write(obj.releaseDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieCacheAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
