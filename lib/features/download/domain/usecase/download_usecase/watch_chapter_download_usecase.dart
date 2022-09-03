import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/core.dart';
import '../../../../chapter/chapter.dart';

@injectable
class WatchDownloadChapterUsecase extends UseCase<Stream<Chapter?>, String> {
  WatchDownloadChapterUsecase(this._repository);

  final IChapterRepository _repository;

  @override
  Future<Either<Failure, Stream<Chapter?>>> call({String? params}) {
    return _repository.watchDownloadChapterItem(params!);
  }
}
