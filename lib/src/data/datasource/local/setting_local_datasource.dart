import 'dart:async';

import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

import '../../../config/config.dart';
import '../../model/setting_model/setting_app.dart';

const String _kThemeApp = 'CACHED_THEME_APP';

abstract class ISettingLocalDataSource {
  Future<void> setThemeApp(String value);
  String getThemeApp();
  Future<SettingApp> setDefault();
}

@Injectable(as: ISettingLocalDataSource)
class SettingLocalDataSource implements ISettingLocalDataSource {
  const SettingLocalDataSource(
    @Named('shared_preferences') this._box,
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
}
