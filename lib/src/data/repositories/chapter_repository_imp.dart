import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../core/core.dart';
import '../../domain/repositories/i_chaper_repository.dart';
import '../datasource/remote/chapter_services.dart';
import '../model/chapter/chapter_model.dart';

@LazySingleton(as: IChapterRepository)
class ChapterRepositoryImp implements IChapterRepository {
  const ChapterRepositoryImp(this.chapterServices);

  final ChapterServices chapterServices;

  @override
  Future<Either<Failure, ChapterModel>> fetchDataChapter(
      String endpoint) async {
    try {
      final data = await chapterServices.getDataChapter(endpoint);
      return Right(data);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
