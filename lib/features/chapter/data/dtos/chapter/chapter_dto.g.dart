// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapter_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ChapterDtoAdapter extends TypeAdapter<ChapterDto> {
  @override
  final int typeId = 3;

  @override
  ChapterDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ChapterDto(
      id: fields[0] as String?,
      title: fields[1] as String?,
      endpoint: fields[2] as String?,
      listImage: (fields[5] as List).cast<ChapterImageDto>(),
      mangaEndpoint: fields[3] as String?,
      nameManga: fields[4] as String?,
      nextChapter: fields[7] as String?,
      prevChapter: fields[6] as String?,
      isDataLocal: fields[8] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, ChapterDto obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.endpoint)
      ..writeByte(3)
      ..write(obj.mangaEndpoint)
      ..writeByte(4)
      ..write(obj.nameManga)
      ..writeByte(5)
      ..write(obj.listImage)
      ..writeByte(6)
      ..write(obj.prevChapter)
      ..writeByte(7)
      ..write(obj.nextChapter)
      ..writeByte(8)
      ..write(obj.isDataLocal);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChapterDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
