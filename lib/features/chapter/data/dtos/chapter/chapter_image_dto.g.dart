// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapter_image_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ChapterImageDtoAdapter extends TypeAdapter<ChapterImageDto> {
  @override
  final int typeId = 4;

  @override
  ChapterImageDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ChapterImageDto(
      urlImage: fields[0] as String?,
      number: fields[1] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, ChapterImageDto obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.urlImage)
      ..writeByte(1)
      ..write(obj.number);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChapterImageDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
