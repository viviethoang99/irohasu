import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/core.dart';
import '../../domain.dart';

@injectable
class FetchDataChapterUsecase implements UseCase<Chapter, String> {
  const FetchDataChapterUsecase(this._repository);

  final IChapterRepository _repository;

  @override
  Future<Either<Failure, Chapter>> call({String? params}) async {
    return _repository.getChapter(params!);
  }
}
