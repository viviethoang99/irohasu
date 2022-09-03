import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/core.dart';
import '../../../../chapter/chapter.dart';

@lazySingleton
class FindChapterUsecase extends UseCase<Chapter?, String> {
  FindChapterUsecase(this._repository);

  final IChapterRepository _repository;

  @override
  FutureOr<Either<Failure, Chapter?>> call({String? params}) async {
    return _repository.findChapter(params!);
  }
}
