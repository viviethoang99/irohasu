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
    return MangaModel(
      title: fields[0] as String,
      thumbnailUrl: fields[1] as String,
      endpoint: fields[2] as String,
      idManga: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MangaModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.thumbnailUrl)
      ..writeByte(2)
      ..write(obj.endpoint)
      ..writeByte(3)
      ..write(obj.idManga);
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
