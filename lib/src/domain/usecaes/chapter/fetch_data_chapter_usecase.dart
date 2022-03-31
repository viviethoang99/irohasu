import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/core.dart';
import '../../../data/model/chapter/chapter_model.dart';
import '../../repositories/i_chaper_repository.dart';

@lazySingleton
class FetchDataChapterUsecase implements UseCase<ChapterModel, String> {
  const FetchDataChapterUsecase(this._repository);

  final IChapterRepository _repository;

  @override
  Future<Either<Failure, ChapterModel>> call({String? params}) async {
    return _repository.fetchDataChapter(params!);
  }
}
