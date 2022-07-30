// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'download_chapter_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DownloadChapterDtoAdapter extends TypeAdapter<DownloadChapterDto> {
  @override
  final int typeId = 3;

  @override
  DownloadChapterDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DownloadChapterDto(
      title: fields[0] as String,
      idManga: fields[1] as String,
      idChapter: fields[2] as String,
      tasks: (fields[3] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, DownloadChapterDto obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.idManga)
      ..writeByte(2)
      ..write(obj.idChapter)
      ..writeByte(3)
      ..write(obj.tasks);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DownloadChapterDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
