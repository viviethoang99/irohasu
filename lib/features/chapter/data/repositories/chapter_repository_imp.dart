import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/core.dart';
import '../../chapter.dart';

@LazySingleton(as: IChapterRepository)
class ChapterRepositoryImp implements IChapterRepository {
  const ChapterRepositoryImp(
    this.chapterServices,
    this.chapterLocal,
  );

  final ChapterApiSource chapterServices;
  final IChapterLocalDatasource chapterLocal;

  @override
  Future<Either<Failure, Chapter>> getChapter(String endpoint) async {
    final repository = await chapterServices.getChapter(endpoint);
    return repository.fold(
      (l) => Left(ServerFailure()),
      (r) => Right(r.toEntity()),
    );
  }

  @override
  Future<bool> deteleChapter(String idChapter) {
    return chapterLocal.deteleChapter(idChapter);
  }

  @override
  Future<Either<Failure, Chapter>> findChapter(String idChapter) async {
    final result = chapterLocal.findChapter(idChapter);
    return result != null ? Right(result.toEntity()) : Left(CacheFailure());
  }

  @override
  Future<Chapter> saveChapter(Chapter chapter) async {
    final result = chapterLocal.saveChapter(ChapterDto.fromEntitie(chapter));
    return result.toEntity();
  }

  @override
  Future<List<Chapter>> getAllChapter(String mangaId) async {
    final response = chapterLocal.getAllChapter(mangaId);
    return response.map((chapter) => chapter.toEntity()).toList();
  }

  @override
  Future<Either<Failure, Stream<Chapter?>>> watchDownloadChapterItem(
      String idChapter) async {
    return right(chapterLocal
            .watchChapterDownload(idChapter)
            .map((event) => event?.toEntity()))
        .fold((l) => Left(ServerFailure()), Right.new);
  }
}
