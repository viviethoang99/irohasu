import '../../data/model/chapter/chapter_model.dart';

abstract class ChapterRepository {
  Future<ChapterModel?> fetchDataChapter(String endpoint);
}
