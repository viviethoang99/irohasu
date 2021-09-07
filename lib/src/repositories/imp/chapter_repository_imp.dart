import '../../models/chapter_model.dart';
import '../../services/chapter_services.dart';
import '../chaper_repository.dart';

class ChapterRepositoryImp implements ChapterRepository {
  ChapterRepositoryImp(this.chapterServices);
  final ChapterServices chapterServices;

  @override
  Future<ChapterModel?> fetchDataChapter(String endpoint) {
    return chapterServices.getDataChapter(endpoint);
  }
}
