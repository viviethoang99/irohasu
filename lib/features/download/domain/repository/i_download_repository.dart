import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';
import '../../download.dart';

typedef DownloadChapRepository = Either<Failure, DownloadChapter>;

abstract class IDownloadRepository {
  Future<DownloadChapRepository> downloadChap(DownloadChapParams params);

  Future<List<String>> getPathsImage(List<String> tasks);

  Future<int> getProgress(List<String> tasks);

  Future<bool> deleteImageChapter(List<String> paths);
}
