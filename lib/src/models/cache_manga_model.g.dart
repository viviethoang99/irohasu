// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cache_manga_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CacheMangaModelAdapter extends TypeAdapter<CacheMangaModel> {
  @override
  final int typeId = 3;

  @override
  CacheMangaModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CacheMangaModel(
      data: fields[1] as MangaDetailModel,
      createTime: fields[0] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, CacheMangaModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.createTime)
      ..writeByte(1)
      ..write(obj.data);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CacheMangaModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
