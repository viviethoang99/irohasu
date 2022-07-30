import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';
import '../domain.dart';

typedef DownloadChapRepository = Either<Failure, DownloadChapter>;

abstract class IChapterRepository {
  Future<Either<Failure, Chapter>> getChapter(String endpoint);

  Future<DownloadChapter> saveChapter(DownloadChapter chapter);

  Future<Either<Failure, DownloadChapter>> findChapter(String idChapter);

  Future<bool> deteleChapter(String idChapter);

  Future<List<DownloadChapter>> getAllChapter(String mangaId);

  Future<Either<Failure, Stream<DownloadChapter?>>> watchDownloadChapterItem(
      String idChapter);

  Future<DownloadChapRepository> downloadChap(DownloadChapParams params);
}
