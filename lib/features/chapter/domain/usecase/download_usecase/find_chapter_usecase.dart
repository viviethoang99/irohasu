import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/core.dart';
import '../../../chapter.dart';

@injectable
class FindChapterUsecase extends UseCase<DownloadChapter, String> {
  FindChapterUsecase(this._repository);

  final IChapterRepository _repository;

  @override
  FutureOr<Either<Failure, DownloadChapter>> call({String? params}) {
    return _repository.findChapter(params!);
  }
}
