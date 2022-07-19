// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapter_item_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ChapterItemDtoAdapter extends TypeAdapter<ChapterItemDto> {
  @override
  final int typeId = 1;

  @override
  ChapterItemDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ChapterItemDto(
      id: fields[0] as String?,
      title: fields[6] as String?,
      endpoint: fields[1] as String?,
      createAt: fields[2] as DateTime?,
      isDownload: fields[5] as String?,
      isReading: fields[4] as bool,
      progressReading: fields[3] as int,
      timeReading: fields[7] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, ChapterItemDto obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.endpoint)
      ..writeByte(2)
      ..write(obj.createAt)
      ..writeByte(3)
      ..write(obj.progressReading)
      ..writeByte(4)
      ..write(obj.isReading)
      ..writeByte(5)
      ..write(obj.isDownload)
      ..writeByte(6)
      ..write(obj.title)
      ..writeByte(7)
      ..write(obj.timeReading);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChapterItemDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
