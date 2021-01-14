// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_setting_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveSettingModelAdapter extends TypeAdapter<HiveSettingModel> {
  @override
  final int typeId = 0;

  @override
  HiveSettingModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveSettingModel(
      readingMode: fields[0] as String,
      backgroundColorChapter: fields[1] as String,
    )
      ..showPageNumberChapter = fields[2] as bool
      ..fullScreenChapter = fields[3] as bool
      ..appTheme = fields[4] as String
      ..dateFormatApp = fields[5] as String
      ..hideTitleMangaDetail = fields[6] as bool;
  }

  @override
  void write(BinaryWriter writer, HiveSettingModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.readingMode)
      ..writeByte(1)
      ..write(obj.backgroundColorChapter)
      ..writeByte(2)
      ..write(obj.showPageNumberChapter)
      ..writeByte(3)
      ..write(obj.fullScreenChapter)
      ..writeByte(4)
      ..write(obj.appTheme)
      ..writeByte(5)
      ..write(obj.dateFormatApp)
      ..writeByte(6)
      ..write(obj.hideTitleMangaDetail);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveSettingModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
