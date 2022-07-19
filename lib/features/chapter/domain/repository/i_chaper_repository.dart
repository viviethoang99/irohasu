import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';
import '../entities/chapter.dart';

abstract class IChapterRepository {
  Future<Either<Failure, Chapter>> getChapter(String endpoint);
}
