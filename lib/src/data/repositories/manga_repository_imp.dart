import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../core/core.dart';
import '../../domain/repositories/i_manga_repository.dart';
import '../datasource/local/history_local_source.dart';
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
  Future<Either<Failure, MangaDetailModel>> fetchMangaDetail(
      String endpoint) async {
    try {
      final data = await _mangaService.fetchMangaDetail(endpoint);
      return Right(data!);
    } on CacheException {
      throw CacheException();
    }
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

  @override
  Future<List> getListChapterReading(String idManga) {
    // TODO: implement getListChapterReading
    throw UnimplementedError();
  }
}
