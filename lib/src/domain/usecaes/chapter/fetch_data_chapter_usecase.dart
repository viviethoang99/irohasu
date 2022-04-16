import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/core.dart';
import '../../entities/chapter.dart';
import '../../repositories/i_chaper_repository.dart';

@lazySingleton
class FetchDataChapterUsecase implements UseCase<Chapter, String> {
  const FetchDataChapterUsecase(this._repository);

  final IChapterRepository _repository;

  @override
  Future<Either<Failure, Chapter>> call({String? params}) async {
    return _repository.getChapter(params!);
  }
}
