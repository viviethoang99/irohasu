import 'package:injectable/injectable.dart';

import '../../domain/repositories/i_manga_repository.dart';
import '../datasource/remote/manga_api_source.dart';
import '../model/manga_detail_model.dart';

@LazySingleton(as: IMangaRepository)
class MangaRepository implements IMangaRepository {
  const MangaRepository(
    this._mangaService,
  );

  final IMangaApiSource _mangaService;

  @override
  Future<ListMangaRemoteRepository> findMangaByPage({int page = 1}) async {
    final listManga = await _mangaService.findMangaByPage(page: page);
    return listManga;
  }

  @override
  Future<ListMangaRemoteRepository> findMangaByQuery({String? query}) {
    return _mangaService.findMangaByQuery(query: query);
  }

  @override
  Future<MangaDetailRemoteRepository> fetchMangaDetail(String endpoint) async {
    final mangaDetail = await _mangaService.findMangaDetail(endpoint);
    return mangaDetail;
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
  Future<void> removeMangaDetail(String id) {
    // TODO: implement removeMangaDetail
    throw UnimplementedError();
  }

  @override
  Future<List> getListChapterReading(String idManga) {
    // TODO: implement getListChapterReading
    throw UnimplementedError();
  }
}
