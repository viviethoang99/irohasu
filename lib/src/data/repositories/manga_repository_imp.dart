import 'package:injectable/injectable.dart';

import '../../domain/repositories/manga_repository.dart';
import '../datasource/local/history_local_source_imp.dart';
import '../datasource/remote/manga_services.dart';
import '../model/manga_detail_model.dart';
import '../model/manga_list_model.dart';

@LazySingleton(as: IMangaRepository)
class MangaRepository implements IMangaRepository {
  MangaRepository(
    this._mangaService,
    this._historyLocalSource,
  );

  final MangaService _mangaService;
  final HistoryLocalSourceImp _historyLocalSource;

  @override
  Future<List<MangaModel>> fetchListManga({int page = 1}) {
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
  Future<void> addListChapterRead(List listManga, String idManga) {
    // TODO: implement addListChapterRead
    throw UnimplementedError();
  }

  @override
  Future<void> addMangaDetail(MangaDetailModel item) {
    // TODO: implement addMangaDetail
    throw UnimplementedError();
  }

  @override
  Future getAllDataChapterRead() {
    // TODO: implement getAllDataChapterRead
    throw UnimplementedError();
  }

  @override
  Stream<List<MangaDetailModel>> getListChapter() {
    // TODO: implement getListChapter
    throw UnimplementedError();
  }

  @override
  Future<MangaDetailModel?> getMangaDetailLocal(String idManga) {
    // TODO: implement getMangaDetailLocal
    throw UnimplementedError();
  }

  @override
  Future<void> removeMangaDetail(String id) {
    // TODO: implement removeMangaDetail
    throw UnimplementedError();
  }
}
