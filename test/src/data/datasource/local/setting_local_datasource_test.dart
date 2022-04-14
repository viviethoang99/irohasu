import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:irohasu/src/config/config.dart';
import 'package:irohasu/src/data/datasource/local/setting_local_datasource.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  group('$SettingLocalDataSource', () {
    late Box<String> settingBox;
    late SettingLocalDataSource localDataSource;

    setUp(() {
      settingBox = _MockBookSetting();
      localDataSource = SettingLocalDataSource(settingBox);
    });

    group('getThemeApp', () {
      test('There are data in the box', () async {
        final id = 'CACHED_THEME_APP';
        when(() => settingBox.get(id)).thenAnswer(
          (_) => 'white',
        );
        final result = localDataSource.getThemeApp();
        expect(result, 'white');
      });

      test('No data in the box', () async {
        final id = 'CACHED_THEME_APP';
        when(() => settingBox.get(id)).thenAnswer(
          (_) => null,
        );
        final result = localDataSource.getThemeApp();
        expect(result, Constants.listTheme.first.type.name);
      });
    });
  });
}

class _MockBookSetting extends Mock implements Box<String> {}
