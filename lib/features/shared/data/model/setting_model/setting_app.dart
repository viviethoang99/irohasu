import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'setting_app.g.dart';

@HiveType(typeId: 3)
class SettingApp extends Equatable {
  const SettingApp({
    this.theme,
  });

  @HiveField(0)
  final String? theme;

  SettingApp copyWith({String? theme}) {
    return SettingApp(
      theme: theme ?? this.theme,
    );
  }

  @override
  List<Object?> get props => [theme];
}
