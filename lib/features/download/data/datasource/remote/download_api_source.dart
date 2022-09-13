import 'package:dartz/dartz.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/core.dart';
import '../../../../../env.dart';
import '../../../domain/domain.dart';
import '../../dtos/dtos.dart';

typedef DownloadChapterDtoRepository = Either<Failure, DownloadChapterDto>;

abstract class IDownloadApiSource {
  Future<DownloadChapterDtoRepository> downloadChapter(
    DownloadChapParams params,
  );
}

@Injectable(as: IDownloadApiSource)
class DownloadApiSourceImpl implements IDownloadApiSource {
  @override
  Future<DownloadChapterDtoRepository> downloadChapter(
      DownloadChapParams params) async {
    try {
      var data = <String>[];
      for (final item in params.chapter.listImage ?? []) {
        final taskId = await FlutterDownloader.enqueue(
          headers: ENV.headersBuilder,
          url: item.urlImage!,
          savedDir: params.saveDirPath,
          showNotification: false,
          openFileFromNotification: false,
          requiresStorageNotLow: false,
        );
        data.add(taskId ?? '');
      }
      return Right(params.toDownloadChapter(data));
    } on Exception {
      return Left(ServerFailure());
    }
  }
}
