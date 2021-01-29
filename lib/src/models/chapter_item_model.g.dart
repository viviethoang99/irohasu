// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapter_item_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ChapterItemAdapter extends TypeAdapter<ChapterItem> {
  @override
  final int typeId = 1;

  @override
  ChapterItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ChapterItem(
      chapterTitle: fields[0] as String,
      chapterEndpoint: fields[1] as String,
      chapterUpload: fields[2] as DateTime,
      progress: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, ChapterItem obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.chapterTitle)
      ..writeByte(1)
      ..write(obj.chapterEndpoint)
      ..writeByte(2)
      ..write(obj.chapterUpload)
      ..writeByte(3)
      ..write(obj.progress);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChapterItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}