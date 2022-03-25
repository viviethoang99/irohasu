import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../../data/model/setting_model/setting_app.dart';
import '../usecaes/update_setting_app_usecase.dart';

abstract class ISettingAppRepository {
  Future<Either<Failure, String>> getThemeApp();
  Future<Either<Failure, void>> setThemeApp(SetThemeAppParams params);
  Future<Either<Failure, SettingApp>> setDefault();
}
