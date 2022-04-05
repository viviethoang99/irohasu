import 'dart:async';

import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

import '../../../config/config.dart';
import '../../model/setting_model/setting_app.dart';

const String _kThemeApp = 'CACHED_THEME_APP';
const String _kReadingMode = 'CACHED_READING_MODE';
const String _kBackgroundReading = 'CACHED_BACKGROUND_READING';

abstract class ISettingLocalDataSource {
  Future<void> setThemeApp(String value);
  String getThemeApp();
  Future<void> setReadingMode(String value);
  String getReadingMode();
  Future<void> setBackgroundReading(String value);
  String getBackgroundReading();
  Future<SettingApp> setDefault();
}

@Injectable(as: ISettingLocalDataSource)
class SettingLocalDataSource implements ISettingLocalDataSource {
  const SettingLocalDataSource(
    @Named('setting_box') this._box,
  );

  final Box _box;

  @override
  String getThemeApp() {
    return _box.get(
      _kThemeApp,
      defaultValue: Constants.listTheme.first.name,
    );
  }

  @override
  Future<SettingApp> setDefault() async {
    const setting = SettingApp();
    return setting;
  }

  @override
  Future<void> setThemeApp(String value) async {
    await _box.put(_kThemeApp, value);
  }

  @override
  String getReadingMode() {
    return _box.get(
      _kReadingMode,
      defaultValue: Constants.listReadingMode.first.name,
    );
  }

  @override
  Future<void> setReadingMode(String value) async {
    await _box.put(_kReadingMode, value);
  }

  @override
  String getBackgroundReading() {
    return _box.get(
      _kBackgroundReading,
      defaultValue: Constants.listReadingMode.first.name,
    );
  }

  @override
  Future<void> setBackgroundReading(String value) async {
    await _box.put(_kBackgroundReading, value);
  }
}
