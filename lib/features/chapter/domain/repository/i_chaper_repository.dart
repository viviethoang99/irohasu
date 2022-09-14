import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';
import '../domain.dart';

abstract class IChapterRepository {
  Future<Either<Failure, Chapter>> getChapter(String endpoint);

  Future<Chapter> saveChapter(Chapter chapter);

  Future<Chapter?> findChapter(String idChapter);

  Future<bool> deteleChapter(String idChapter);

  Future<List<Chapter>> getAllChapter(String mangaId);
}
