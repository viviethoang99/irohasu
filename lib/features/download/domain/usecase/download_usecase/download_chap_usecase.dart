import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/core.dart';
import '../../../../chapter/chapter.dart';
import '../../../download.dart';

@injectable
class DownloadChapUsecase extends UseCase<Chapter, DownloadChapParams> {
  DownloadChapUsecase(
    this._chapterRepository,
    this._downloadRepository,
  );

  final IChapterRepository _chapterRepository;
  final IDownloadRepository _downloadRepository;

  @override
  FutureOr<Either<Failure, Chapter>> call({DownloadChapParams? params}) async {
    try {
      await ToolMethods.createFolder(params!.saveDirPath);
      final data = await _downloadRepository.downloadChap(params);
      final downloadDto = data.fold((l) => null, (r) => r.toListImage());
      if (downloadDto != null) {
        final chapter = params.convertChapterDownload(downloadDto);
        await _chapterRepository.saveChapter(chapter);
        return Right(chapter);
      }
      return Left(ServerFailure());
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}

class DownloadChapParams {
  const DownloadChapParams({required this.chapter, required this.path});

  final Chapter chapter;
  final String path;

  DownloadChapterDto toDownloadChapter(List<String> tasks) {
    return DownloadChapterDto(
      title: chapter.title ?? '',
      idManga: chapter.mangaEndpoint.toId(1),
      idChapter: chapter.id.toId(0),
      tasks: tasks,
    );
  }

  Chapter convertChapterDownload(List<ChapterImage> listImage) {
    return chapter.copyWith(listImage: listImage);
  }

  String get idManga => chapter.mangaEndpoint.toId(1);

  String get idChapter => chapter.id.toId(0);

  String get saveDirPath => '$path/download/$idManga/$idChapter';
}

extension on String? {
  String toId(int index) => this?.split('/')[index] ?? 'valid';
}
