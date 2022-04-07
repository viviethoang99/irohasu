import 'package:dartz/dartz.dart';

import '../../../core/core.dart';
import '../../data/datasource/remote/manga_api_source.dart';
import '../../data/model/manga_detail_model.dart';
import '../../data/model/manga_list_model.dart';

abstract class IMangaRepository {
  /// Returns [MangaDetailModel]s matching with the given [endpoint].
  Future<Either<Failure, MangaDetailModel>> fetchMangaDetail(String endpoint);

  /// Returns list [MangaModel] matching with the given [page] website.
  Future<ListMangaRemoteRepository> findMangaByPage({int page});

  Future<ListMangaRemoteRepository> findMangaByQuery({String? query});

  Future<List> getListChapterReading(String idManga);

  Future<void> addListChapterRead(List listManga, String idManga);

  Future<void> addMangaDetail(MangaDetailModel item);

  Future<void> removeMangaDetail(String id);

  Stream<List<MangaDetailModel>> getListChapter();

  Future getAllDataChapterRead();
}
