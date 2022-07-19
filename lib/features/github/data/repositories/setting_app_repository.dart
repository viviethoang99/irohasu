import 'dart:async';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../core/core.dart';
import '../../domain/domain.dart';
import '../datasource/local/setting_local_datasource.dart';

@Injectable(as: ISettingAppRepository)
class SettingAppRepository implements ISettingAppRepository {
  const SettingAppRepository(this._localDataSource);

  final ISettingLocalDataSource _localDataSource;

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
