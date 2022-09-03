import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repository/repository.dart';
import '../../domain/usecase/download_usecase/download_chap_usecase.dart';
import '../datasource/local/download_local_source.dart';
import '../datasource/remote/download_api_source.dart';

@LazySingleton(as: IDownloadRepository)
class DownloadRepositoryImpl implements IDownloadRepository {
  const DownloadRepositoryImpl(
    this._apiSource,
    this._localSource,
  );

  final IDownloadApiSource _apiSource;
  final IDownloadLocalSource _localSource;

  @override
  Future<bool> deleteImageChapter(List<String> paths) {
    return _localSource.deleteImageChapter(paths);
  }

  @override
  Future<DownloadChapRepository> downloadChap(DownloadChapParams params) async {
    final data = await _apiSource.downloadChapter(params);
    return data.fold(left, (r) => Right(r.toEntity()));
  }

  @override
  Future<List<String>> getPathsImage(List<String> tasks) {
    return _localSource.getPathsImageChapter(tasks);
  }

  @override
  Future<int> getProgress(List<String> tasks) {
    return _localSource.getProgress(tasks);
  }
}
