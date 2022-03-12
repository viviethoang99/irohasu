import 'dart:async';

import 'package:dartz/dartz.dart';

import '../../core/error/exceptions.dart';
import '../../core/error/failures.dart';
import '../../domain/entities/entities.dart';
import '../../domain/repositories/i_setting_app_repository.dart';
import '../datasource/local/local.dart';
import '../model/setting_model/setting_app.dart';

class SettingAppRepository implements ISettingAppRepository {
  SettingAppRepository(this._localDataSource);

  final ISettingLocalDataSource _localDataSource;

  @override
  Future<Either<Failure, void>> changeSetting(
      UpdateSettingAppParams params) async {
    try {
      await _localDataSource.updateSetting(params.model);
      return const Right(null);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, SettingApp>> setDefault() async {
    final defaultSetting = const SettingApp();
    try {
      unawaited(_localDataSource.updateSetting(defaultSetting));
      return Right(defaultSetting);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, SettingApp>> getSetting() async {
    try {
      final model = await _localDataSource.getSettingApp();
      return Right(model);
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}
