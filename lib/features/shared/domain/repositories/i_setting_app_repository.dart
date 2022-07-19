import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';

import '../usecase/setting_app/update_background_reading_usecase.dart';
import '../usecase/setting_app/update_reading_mode_usecase.dart';
import '../usecase/setting_app/update_setting_app_usecase.dart';

abstract class ISettingAppRepository {
  /// Return a [String] like the name of [ThemeApp]
  /// Default value is 'light'
  Future<Either<Failure, String>> getThemeApp();

  /// Not value returned.
  /// The parameter passed is the [SetThemeAppParams] attribute
  /// of the [ThemeApp]
  Future<Either<Failure, void>> setThemeApp(SetThemeAppParams params);

  /// Return a [String] like the name of [ReadMode]
  /// Default value is 'webtoon'
  Future<Either<Failure, String>> getReadingMode();

  /// Not value returned.
  /// The parameter passed is the [SetReadingModeParams] attribute
  /// of the [ReadMode]
  Future<Either<Failure, void>> setReadingMode(SetReadingModeParams params);

  /// Return a [String] like the name of [BackgroundReading]
  /// Default value is 'black'
  Future<Either<Failure, String>> getBackgroundReading();

  /// Not value returned.
  /// The parameter passed is the [SetBackgroundReadingParams] attribute
  /// of the [BackgroundReading]
  Future<Either<Failure, void>> setBackgroundReading(
      SetBackgroundReadingParams params);

  Future<Either<Failure, String>> getdownloadPath();
}
