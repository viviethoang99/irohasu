import '../models/manga_detail_model.dart';
import '../models/manga_list_model.dart';

abstract class MangaRepository {
  Future<List<MangaModel>> fetchListManga({int? page});
  Future<List<MangaModel>> fetchListMangaSearch({String? query});
  Future<MangaDetailModel?> fetchDataMangaDetail(String endpoint);
}
