import 'package:hive/hive.dart';

class Preferences {
  Preferences._(this._box);

  static const preferencesBox = 'preferencesBox';
  static const _readingModeKey = '_readingModeKey';
  static const _backgroundColorChapterKey = '_backgroundColorChapterKey';
  static const _appThemeKey = '_appThemeKey';

  // static const _showPageNumberChapterKey = '_showPageNumberChapterKey';
  // static const _fullScreenChapterKey = '_fullScreenChapterKey';
  // static const _dateFormatAppKey = '_dateFormatAppKey';
  // static const _hideTitleMangaDetailKey = '_hideTitleMangaDetailKey';
  // static const _autoUpdateKey = '_autoUpdateKey';

  final Box<dynamic> _box;

  static Future<Preferences> getInstance() async {
    final box = await Hive.openBox<dynamic>(preferencesBox);
    return Preferences._(box);
  }

  String getReadingMode() => _getValue(_readingModeKey);

  Future<void> setReadingMode(String readingMode) =>
      _setValue(_readingModeKey, readingMode);

  String getBackgroundColorChapter() => _getValue(_backgroundColorChapterKey);

  Future<void> setBackgroundColorChapter(String counter) =>
      _setValue(_backgroundColorChapterKey, counter);

  int getAppTheme() => _getValue(_appThemeKey);

  Future<void> setAppTheme(int counter) => _setValue(_appThemeKey, counter);

  T _getValue<T>(dynamic key, {T defaultValue}) =>
      _box.get(key, defaultValue: defaultValue) as T;

  Future<void> _setValue<T>(dynamic key, T value) => _box.put(key, value);
}
