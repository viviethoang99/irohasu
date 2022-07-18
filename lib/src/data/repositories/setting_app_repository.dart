import 'dart:async';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';

import '../../../core/core.dart';
import '../../domain/repositories/i_setting_app_repository.dart';
import '../../domain/usecaes/setting_app/update_background_reading_usecase.dart';
import '../../domain/usecaes/setting_app/update_reading_mode_usecase.dart';
import '../../domain/usecaes/setting_app/update_setting_app_usecase.dart';
import '../datasource/local/setting_local_datasource.dart';

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
  Future<Either<Failure, String>> getThemeApp() async {
    try {
      final model = _localDataSource.getThemeApp();
      return Right(model);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, String>> getReadingMode() async {
    try {
      final model = _localDataSource.getReadingMode();
      return Right(model);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, void>> setReadingMode(
      SetReadingModeParams params) async {
    try {
      await _localDataSource.setReadingMode(params.name);
      return const Right(null);
    } on CacheException {
      throw CacheException();
    }
  }

  @override
  Future<Either<Failure, String>> getBackgroundReading() async {
    try {
      final model = _localDataSource.getBackgroundReading();
      return Right(model);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, void>> setBackgroundReading(
      SetBackgroundReadingParams params) async {
    try {
      await _localDataSource.setBackgroundReading(params.name);
      return const Right(null);
    } on CacheException {
      throw CacheException();
    }
  }

  @override
  Future<Either<Failure, String>> getdownloadPath() async {
    try {
      late String? downloadPath;
      downloadPath = await _localDataSource.getdownloadPath();
      if (downloadPath == null) {
        downloadPath = (Platform.isIOS
                ? await getApplicationDocumentsDirectory()
                : await getExternalStorageDirectory())!
            .path;
        await _localDataSource.setdownloadPath(downloadPath);
      }
      return Right(downloadPath);
    } on CacheException {
      throw CacheException();
    }
  }
}
