import 'package:dartz/dartz.dart';

import '../../../core/core.dart';
import '../../data/model/setting_model/setting_app.dart';
import '../usecaes/setting_app/update_setting_app_usecase.dart';

abstract class ISettingAppRepository {
  /// Return a [String] like the name of [ThemeApp]
  /// Default value is 'light'
  Future<Either<Failure, String>> getThemeApp();

  /// Not value returned.
  /// The parameter passed is the [SetThemeAppParams] attribute 
  /// of the [ThemeApp]
  Future<Either<Failure, void>> setThemeApp(SetThemeAppParams params);

  
  Future<Either<Failure, SettingApp>> setDefault();
}
