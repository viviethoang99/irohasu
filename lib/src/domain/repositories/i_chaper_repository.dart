import 'package:dartz/dartz.dart';

import '../../../core/core.dart';
import '../../data/model/chapter/chapter_model.dart';

abstract class IChapterRepository {
  Future<Either<Failure, ChapterModel>> fetchDataChapter(String endpoint);
}
