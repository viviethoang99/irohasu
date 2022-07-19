import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:irohasu/config/config.dart';
import 'package:irohasu/features/shared/data/datasource/local/setting_local_datasource.dart';
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
        const id = 'CACHED_THEME_APP';
        when(() => settingBox.get(id)).thenAnswer(
          (_) => 'white',
        );
        final result = localDataSource.getThemeApp();
        expect(result, 'white');
      });

      test('No data in the box', () async {
        const id = 'CACHED_THEME_APP';
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
