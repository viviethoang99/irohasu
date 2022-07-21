// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manga_detail_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MangaDetailDtoAdapter extends TypeAdapter<MangaDetailDto> {
  @override
  final int typeId = 0;

  @override
  MangaDetailDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MangaDetailDto(
      idManga: fields[0] as String,
      title: fields[1] as String,
      endpoint: fields[3] as String,
      thumbnailUrl: fields[2] as String,
      status: fields[7] as String?,
      listChapter:
          fields[9] == null ? [] : (fields[9] as List).cast<ChapterItemDto>(),
      listGenres:
          fields[10] == null ? [] : (fields[10] as List).cast<GenresDto>(),
      author: fields[8] as String?,
      like: fields[6] as String?,
      dislike: fields[5] as String?,
      description: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, MangaDetailDto obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.idManga)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.thumbnailUrl)
      ..writeByte(3)
      ..write(obj.endpoint)
      ..writeByte(4)
      ..write(obj.description)
      ..writeByte(5)
      ..write(obj.dislike)
      ..writeByte(6)
      ..write(obj.like)
      ..writeByte(7)
      ..write(obj.status)
      ..writeByte(8)
      ..write(obj.author)
      ..writeByte(9)
      ..write(obj.listChapter)
      ..writeByte(10)
      ..write(obj.listGenres);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MangaDetailDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
