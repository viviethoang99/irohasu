import '../../domain/repositories/chaper_repository.dart';
import '../datasource/remote/chapter_services.dart';
import '../model/chapter/chapter_model.dart';

class ChapterRepositoryImp implements ChapterRepository {
  ChapterRepositoryImp(this.chapterServices);
  final ChapterServices chapterServices;

  @override
  Future<ChapterModel?> fetchDataChapter(String endpoint) {
    return chapterServices.getDataChapter(endpoint);
  }
}
