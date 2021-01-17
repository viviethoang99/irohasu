// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_chapter_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveChapterModelAdapter extends TypeAdapter<HiveChapterModel> {
  @override
  final int typeId = 1;

  @override
  HiveChapterModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveChapterModel(
      lastChapter: fields[0] as int,
      mangaEndpoint: fields[1] as String,
      chapterEndpoint: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HiveChapterModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.lastChapter)
      ..writeByte(1)
      ..write(obj.mangaEndpoint)
      ..writeByte(2)
      ..write(obj.chapterEndpoint);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveChapterModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
