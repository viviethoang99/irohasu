// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting_app.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SettingAppAdapter extends TypeAdapter<SettingApp> {
  @override
  final int typeId = 3;

  @override
  SettingApp read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SettingApp(
      theme: fields[0] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, SettingApp obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.theme);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SettingAppAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
