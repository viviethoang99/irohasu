import '../../data/model/manga_detail_model.dart';
import '../../data/model/manga_list_model.dart';

abstract class MangaRepository {
  Future<List<MangaModel>> fetchListManga({int? page});

  Future<List<MangaModel>> fetchListMangaSearch({String? query});

  Future<MangaDetailModel?> fetchMangaDetail(String endpoint);

  Future<List> getListChapterReading(String idManga);

  Future<MangaDetailModel?> getMangaDetailLocal(String idManga);

  Future<void> addListChapterRead(List listManga, String idManga);

  Future<void> addMangaDetail(MangaDetailModel item);

  Future<void> removeMangaDetail(String id);

  Stream<List<MangaDetailModel>> getListChapter();

  Future getAllDataChapterRead();
}
