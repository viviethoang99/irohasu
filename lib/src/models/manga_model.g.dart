// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manga_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MangaModelAdapter extends TypeAdapter<MangaModel> {
  @override
  final int typeId = 0;

  @override
  MangaModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MangaModel()
      ..idManga = fields[0] as String
      ..title = fields[1] as String
      ..thumbnailUrl = fields[2] as String
      ..endpoint = fields[3] as String
      ..description = fields[4] as String
      ..dislike = fields[5] as String
      ..like = fields[6] as String
      ..status = fields[7] as String
      ..author = fields[8] as String
      ..listChapter = (fields[9] as List)?.cast<ChapterItem>()
      ..isFavorite = fields[10] as bool
      ..listChapRead = (fields[11] as List)?.cast<ChapterItem>()
      ..listDownload = (fields[12] as List)?.cast<ChapterItem>();
  }

  @override
  void write(BinaryWriter writer, MangaModel obj) {
    writer
      ..writeByte(13)
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
      ..write(obj.isFavorite)
      ..writeByte(11)
      ..write(obj.listChapRead)
      ..writeByte(12)
      ..write(obj.listDownload);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MangaModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
