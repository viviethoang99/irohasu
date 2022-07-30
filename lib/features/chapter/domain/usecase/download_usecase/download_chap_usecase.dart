import 'dart:async';

import 'package:injectable/injectable.dart';

import '../../../../../core/core.dart';
import '../../../chapter.dart';

@lazySingleton
class DownloadChapUsecase extends UseCase<DownloadChapter, DownloadChapParams> {
  DownloadChapUsecase(this._chapterRepository);

  final IChapterRepository _chapterRepository;

  @override
  FutureOr<DownloadChapRepository> call({DownloadChapParams? params}) async {
    return _chapterRepository.downloadChap(params!);
  }
}

class DownloadChapParams {
  const DownloadChapParams({
    required this.idManga,
    required this.path,
    this.idChapter,
    this.title,
    this.listImage = const [],
  });

  final String idManga;
  final String? idChapter;
  final String? title;
  final String path;
  final List<ChapterImage> listImage;

  DownloadChapterDto toDownloadChapter(List<String> tasks) {
    return DownloadChapterDto(
      title: title ?? '',
      idManga: idManga,
      idChapter: idChapter ?? 'valid',
      tasks: tasks,
    );
  }

  String get saveDirPath => '$path/download/$idManga/$idChapter';
}
