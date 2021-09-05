// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genres_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GenresAdapter extends TypeAdapter<Genres> {
  @override
  final int typeId = 2;

  @override
  Genres read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Genres(
      genreName: fields[0] as String?,
      urlGenre: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Genres obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.genreName)
      ..writeByte(1)
      ..write(obj.urlGenre);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GenresAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
