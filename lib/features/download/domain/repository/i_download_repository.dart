import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';
import '../../../chapter/chapter.dart';
import '../../download.dart';

typedef DownloadChapRepository = Either<Failure, DownloadChapter>;

abstract class IDownloadRepository {
  Future<DownloadChapRepository> downloadChap(DownloadChapParams params);

  Future<List<ChapterImage>> getPathsImage(List<String>? tasks);

  Future<int> getProgress(List<String> tasks);

  Future<bool> deleteImageChapter(List<String> paths);

  Stream<List<String>> watchListChapterDownload(String idManga);

  Future<List<String>> findAllChapterDownload(String idManga);

  Future<void> deleteChapter(int idChapter);

  Future<void> deleteManga(String idManga);
}
