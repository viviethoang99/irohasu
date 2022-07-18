import 'dart:async';

import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

const String _downloadPath = 'DOWNLOAD_PATH';

abstract class ISettingLocalDataSource {
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
  Future<String?> getdownloadPath() async {
    return _box.get(_downloadPath);
  }

  @override
  Future<void> setdownloadPath(String downloadPath) {
    return _box.put(_downloadPath, downloadPath);
  }
}
