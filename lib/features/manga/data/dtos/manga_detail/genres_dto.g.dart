// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genres_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GenresDtoAdapter extends TypeAdapter<GenresDto> {
  @override
  final int typeId = 2;

  @override
  GenresDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GenresDto(
      name: fields[0] as String?,
      url: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, GenresDto obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.url);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GenresDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
