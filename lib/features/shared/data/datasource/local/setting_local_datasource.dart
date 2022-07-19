import 'dart:async';

import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

import '../../../../../config/config.dart';

const String _kThemeApp = 'CACHED_THEME_APP';
const String _kReadingMode = 'CACHED_READING_MODE';
const String _kBackgroundReading = 'CACHED_BACKGROUND_READING';
const String _downloadPath = 'DOWNLOAD_PATH';

abstract class ISettingLocalDataSource {
  Future<void> setThemeApp(String value);
  String getThemeApp();
  Future<void> setReadingMode(String value);
  String getReadingMode();
  Future<void> setBackgroundReading(String value);
  String getBackgroundReading();

  // Download path
  Future<String?> getdownloadPath();
  Future<void> setdownloadPath(String downloadPath);
}

@Injectable(as: ISettingLocalDataSource)
class SettingLocalDataSource implements ISettingLocalDataSource {
  const SettingLocalDataSource(
    @Named('setting_box') this._box,
  );

  final Box<String> _box;

  @override
  String getThemeApp() {
    return _box.get(_kThemeApp) ?? Constants.listTheme.first.type.name;
  }

  @override
  Future<void> setThemeApp(String value) async {
    await _box.put(_kThemeApp, value);
  }

  @override
  String getReadingMode() {
    return _box.get(_kReadingMode) ?? Constants.listReadingMode.first.type.name;
  }

  @override
  Future<void> setReadingMode(String value) async {
    await _box.put(_kReadingMode, value);
  }

  @override
  String getBackgroundReading() {
    return _box.get(_kBackgroundReading) ??
        Constants.listBackgroundColor.first.type.name;
  }

  @override
  Future<void> setBackgroundReading(String value) async {
    await _box.put(_kBackgroundReading, value);
  }

  @override
  Future<String?> getdownloadPath() async {
    return _box.get(_downloadPath);
  }

  @override
  Future<void> setdownloadPath(String downloadPath) {
    return _box.put(_downloadPath, downloadPath);
  }
}
