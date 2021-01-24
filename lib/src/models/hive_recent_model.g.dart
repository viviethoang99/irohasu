// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_recent_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveRecentModelAdapter extends TypeAdapter<HiveRecentModel> {
  @override
  final int typeId = 1;

  @override
  HiveRecentModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveRecentModel(
      idManga: fields[0] as String,
      listChapRead: (fields[1] as List)?.cast<ChapterList>(),
    );
  }

  @override
  void write(BinaryWriter writer, HiveRecentModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.idManga)
      ..writeByte(1)
      ..write(obj.listChapRead);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveRecentModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
