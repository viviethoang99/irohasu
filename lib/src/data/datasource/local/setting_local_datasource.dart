import 'dart:async';

import 'package:hive/hive.dart';
import '../../model/setting_model/setting_app.dart';

const String kScreenMode = 'CACHED_SETTING_APP';

abstract class ISettingLocalDataSource {
  Future<void> updateSetting(SettingApp value);
  Future<SettingApp> getSettingApp();
  Future<SettingApp> setDefault();
}

class SettingLocalDataSource implements ISettingLocalDataSource {
  SettingLocalDataSource(this._box);

  final Box _box;

  @override
  Future<SettingApp> getSettingApp() {
    return _box.get(kScreenMode);
  }

  @override
  Future<SettingApp> setDefault() async {
    final setting = const SettingApp();
    unawaited(updateSetting(setting));
    return setting;
  }

  @override
  Future<void> updateSetting(SettingApp value) async {
    await _box.put(kScreenMode, value);
  }
}
