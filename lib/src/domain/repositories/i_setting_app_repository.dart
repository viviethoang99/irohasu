import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../../data/model/setting_model/setting_app.dart';
import '../entities/entities.dart';

abstract class ISettingAppRepository {
  Future<Either<Failure, SettingApp>> getSetting();
  Future<Either<Failure, void>> changeSetting(UpdateSettingAppParams params);
  Future<Either<Failure, SettingApp>> setDefault();
}
