import '../models/manga_list_model.dart';

abstract class MangaRepository {
  Future<List<MangaModel>> fetchListManga();
  Future<List<MangaModel>> fetchListMangaSearch();
}
