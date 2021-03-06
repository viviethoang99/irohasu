// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manga_detail_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MangaDetailModelAdapter extends TypeAdapter<MangaDetailModel> {
  @override
  final int typeId = 0;

  @override
  MangaDetailModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MangaDetailModel(
      idManga: fields[0] as String,
      title: fields[1] as String,
      isFavorite: fields[10] as bool,
      status: fields[7] as String,
      listChapter: (fields[9] as List)?.cast<ChapterItem>(),
      author: fields[8] as String,
      like: fields[6] as String,
      dislike: fields[5] as String,
      description: fields[4] as String,
      endpoint: fields[3] as String,
      thumbnailUrl: fields[2] as String,
      listGenres: (fields[13] as List)?.cast<Genres>(),
    )
      ..listChapRead = (fields[11] as List)?.cast<String>()
      ..listDownload = (fields[12] as List)?.cast<String>();
  }

  @override
  void write(BinaryWriter writer, MangaDetailModel obj) {
    writer
      ..writeByte(14)
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
      ..write(obj.listDownload)
      ..writeByte(13)
      ..write(obj.listGenres);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MangaDetailModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
