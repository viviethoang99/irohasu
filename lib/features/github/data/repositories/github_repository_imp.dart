import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../core/core.dart';
import '../../github.dart';

@Injectable(as: IGithubRepository)
class GithubRepository implements IGithubRepository {
  GithubRepository(this._apiSource, this._localDataSource);

  final IGithubApiSource _apiSource;
  final IGithubLocalDataSource _localDataSource;

  @override
  Future<Either<Failure, ReleaseApp>> getLatestRelease() async {
    final response = await _apiSource.getLatestRelease();
    return response.fold(left, (r) => Right(r.toEntity()));
  }

  @override
  Future<Either<Failure, List<ReleaseApp>>> getReleases() async {
    final response = await _apiSource.getReleases();
    return response.fold(left, (r) => Right(r.toEntities()));
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
      return Left(CacheFailure());
    }
  }
}
