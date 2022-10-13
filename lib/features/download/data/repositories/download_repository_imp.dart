import 'package:collection/collection.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../chapter/chapter.dart';
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
  Future<List<ChapterImage>> getPathsImage(List<String>? tasks) async {
    if (tasks?.isEmpty ?? true) {
      return Future.value([]);
    }
    final listPath = await _localSource.getPathsImageChapter(tasks!);
    return List<ChapterImage>.from(
      listPath.mapIndexed(
        (index, element) => ChapterImage(urlImage: element, number: index),
      ),
    );
  }

  @override
  Future<int> getProgress(List<String> tasks) {
    return _localSource.getProgress(tasks);
  }

  @override
  Stream<List<String>> watchListChapterDownload(String idManga) {
    return _localSource
        .watchListChapterDownload(idManga)
        .map((event) => event.map((e) => e.endpoint ?? '').toList());
  }

  @override
  Future<List<String>> findAllChapterDownload(String idManga) async {
    final data = await _localSource.findAllChapterDownload(idManga);
    return data.map((e) => e.idManga).toList();
  }

  @override
  Future<void> deleteChapter(int idChapter) async {
    final chapter = await _localSource.deleteChapter(idChapter);
    final listTask = chapter?.listImage.map((e) => e.urlImage ?? '').toList();
    await _localSource.deleteImageChapter(listTask ?? []);
    return Future.value();
  }

  @override
  Future<void> deleteManga(String idManga) async {
    final listChap = await _localSource.findAllChapterDownload(idManga);
    for (var chap in listChap) {
      await deleteChapter(chap.id);
    }
    return Future.value();
  }
}
