// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_manga_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveMangaModelAdapter extends TypeAdapter<HiveMangaModel> {
  @override
  final int typeId = 0;

  @override
  HiveMangaModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveMangaModel(
      mangaEndpoint: fields[0] as String,
      thumb: fields[1] as String,
      title: fields[2] as String,
      idManga: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HiveMangaModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.mangaEndpoint)
      ..writeByte(1)
      ..write(obj.thumb)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.idManga);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveMangaModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
