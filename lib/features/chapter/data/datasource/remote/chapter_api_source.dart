import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/core.dart';
import '../../../chapter.dart';

/// A class responsible for fetching chapter data from website using an
abstract class IChapterApiSource {
  /// Returns an list [ChapterDto] by fetching it from the website
  /// HTTP call with the [endpoint].
  Future<Either<Failure, ChapterDto>> getChapter(String endpoint);

  Future<Either<Failure, DownloadChapterDto>> downloadChapter(
    DownloadChapParams params,
  );
}

@injectable
class ChapterApiSource implements IChapterApiSource {
  const ChapterApiSource(this._dio);

  final Dio _dio;

  @override
  Future<Either<Failure, ChapterDto>> getChapter(String endpoint) async {
    try {
      final response = await _dio.get(endpoint);
      final document = DartSoup(response.data);
      return Right(ChapterDto.fromHTML(document, endpoint));
    } on Exception {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, DownloadChapterDto>> downloadChapter(
      DownloadChapParams params) async {
    try {
      var data = <String>[];
      for (final item in params.listImage) {
        final taskId = await FlutterDownloader.enqueue(
          url: item.urlImage!,
          savedDir: params.saveDirPath,
          fileName: item.number.toString(),
          showNotification: false,
          openFileFromNotification: false,
        );
        data.add(taskId ?? '');
      }
      return Right(params.toDownloadChapter(data));
    } on Exception {
      return Left(ServerFailure());
    }
  }
}
