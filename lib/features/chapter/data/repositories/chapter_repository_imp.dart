import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/core.dart';
import '../../domain/entities/chapter.dart';
import '../../domain/repository/i_chaper_repository.dart';
import '../datasource/remote/chapter_api_source.dart';

@LazySingleton(as: IChapterRepository)
class ChapterRepositoryImp implements IChapterRepository {
  const ChapterRepositoryImp(this.chapterServices);

  final ChapterApiSource chapterServices;

  @override
  Future<Either<Failure, Chapter>> getChapter(String endpoint) async {
    final repository = await chapterServices.getChapter(endpoint);
    return repository.fold(
      (l) => Left(ServerFailure()),
      (r) => Right(r.toEntity()),
    );
  }
}
