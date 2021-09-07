import '../../models/manga_detail_model.dart';
import '../../models/manga_list_model.dart';
import '../../services/manga_services.dart';
import '../manga_repository.dart';

class MangaRepositoryImp implements MangaRepository {
  MangaRepositoryImp(this.mangaService);

  final MangaService mangaService;

  @override
  Future<List<MangaModel>> fetchListManga({int? page}) {
    return mangaService.fetchListManga(page: page);
  }

  @override
  Future<List<MangaModel>> fetchListMangaSearch({String? query}) {
    return mangaService.getDataResult(query: query);
  }

  @override
  Future<MangaDetailModel?> fetchDataMangaDetail(String endpoint) {
    return mangaService.fetchMangaDetail(endpoint);
  }
}
