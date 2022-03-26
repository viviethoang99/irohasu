import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../core/core.dart';
import '../../domain/repositories/i_setting_app_repository.dart';
import '../../domain/usecaes/setting_app/update_setting_app_usecase.dart';
import '../datasource/local/setting_local_datasource.dart';
import '../model/setting_model/setting_app.dart';

@Injectable(as: ISettingAppRepository)
class SettingAppRepository implements ISettingAppRepository {
  const SettingAppRepository(this._localDataSource);

  final ISettingLocalDataSource _localDataSource;

  @override
  Future<Either<Failure, void>> setThemeApp(SetThemeAppParams params) async {
    try {
      await _localDataSource.setThemeApp(params.model);
      return const Right(null);
    } on CacheException {
      throw CacheException();
    }
  }

  @override
  Future<Either<Failure, SettingApp>> setDefault() async {
    final defaultSetting = const SettingApp();
    try {
      return Right(defaultSetting);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, String>> getThemeApp() async {
    try {
      final model = _localDataSource.getThemeApp();
      return Right(model);
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}
