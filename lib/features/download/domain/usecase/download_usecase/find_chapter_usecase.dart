import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/core.dart';
import '../../../../chapter/chapter.dart';
import '../../../download.dart';

@lazySingleton
class FindChapterUsecase extends UseCase<Chapter?, String> {
  FindChapterUsecase(this._chapterRepository, this._downloadRepository);

  final IDownloadRepository _downloadRepository;
  final IChapterRepository _chapterRepository;

  @override
  FutureOr<Either<Failure, Chapter?>> call({String? params}) async {
    final idChapter = params!.toId;
    final chapterLocal = await _chapterRepository.findChapter(idChapter);
    if (chapterLocal != null) {
      final listTask =
          chapterLocal.listImage?.map((e) => e.urlImage ?? '').toList();
      final images = await _downloadRepository.getPathsImage(listTask);
      return Right(chapterLocal.copyWith(listImage: images));
    }
    return Left(CacheFailure());
  }
}
