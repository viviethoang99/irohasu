import '../../local/history_local_source_imp.dart';
import '../../local/manga_local_source_imp.dart';
import '../../models/manga_detail_model.dart';
import '../../models/manga_list_model.dart';
import '../../services/manga_services.dart';
import '../manga_repository.dart';

class MangaRepositoryImp implements MangaRepository {
  MangaRepositoryImp._(
    this._mangaService,
    this._historyLocalSource,
    this._mangaLocalSource,
  );

  final MangaService _mangaService;
  final HistoryLocalSourceImp _historyLocalSource;
  final MangaLocalSourceImp _mangaLocalSource;

  static Future<MangaRepositoryImp> getInstance() async {
    final manga = await MangaLocalSourceImp.getInstance();
    final history = await HistoryLocalSourceImp.getInstance();
    final service = MangaService();
    print('${DateTime.now()} ==================>  Get Instance');
    return MangaRepositoryImp._(service, history, manga);
  }

  @override
  Future<List<MangaModel>> fetchListManga({int? page}) {
    return _mangaService.fetchListManga(page: page);
  }

  @override
  Future<List<MangaModel>> fetchListMangaSearch({String? query}) {
    return _mangaService.getDataResult(query: query);
  }

  @override
  Future<MangaDetailModel?> fetchMangaDetail(String endpoint) {
    return _mangaService.fetchMangaDetail(endpoint);
  }

  @override
  Future<List> getListChapterReading(String idManga) {
    return _historyLocalSource.getList(idManga: idManga);
  }

  @override
  Future<MangaDetailModel?> getMangaDetailLocal(String idManga) async {
    return _mangaLocalSource.getMangaDetail(idManga);
  }

  @override
  Future<void> addListChapterRead(List listChapter, String idManga) {
    return _historyLocalSource.addList(
      listData: listChapter,
      idManga: idManga,
    );
  }

  @override
  Future<void> addMangaDetail(MangaDetailModel item) {
    return _mangaLocalSource.saveManga(item);
  }

  @override
  Future<void> removeMangaDetail(String id) {
    return _mangaLocalSource.removeById(id);
  }

  @override
  Stream<List<MangaDetailModel>> getListChapter() {
    return _mangaLocalSource.watchListManga();
  }

  @override
  Future getAllDataChapterRead() async {
    return await _historyLocalSource.getDataKey();
  }
}
