import 'dart:async';

import 'package:injectable/injectable.dart';

import '../../domain/repositories/i_manga_repository.dart';
import '../datasource/local/manga_local_source.dart';
import '../datasource/remote/manga_api_source.dart';
import '../model/manga_detail_model.dart';

@LazySingleton(as: IMangaRepository)
class MangaRepository implements IMangaRepository {
  const MangaRepository(
    this._mangaService,
    this._mangaLocalSource,
  );

  final IMangaApiSource _mangaService;
  final IMangaLocalSource _mangaLocalSource;

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
    unawaited(mangaDetail.fold(
      (error) => null,
      saveManga,
    ));
    return mangaDetail;
  }

  @override
  Future<void> saveManga(MangaDetailModel manga) {
    return _mangaLocalSource.saveManga(manga);
  }

  @override
  Future<void> deleteManga(String endpoint) {
    return _mangaLocalSource.deleteManga(endpoint);
  }

  @override
  Future<void> deleteAllManga() {
    return _mangaLocalSource.deleteAllManga();
  }

  @override
  Future<List<MangaDetailModel>> getAllManga() {
    return _mangaLocalSource.findAllManga();
  }
}
