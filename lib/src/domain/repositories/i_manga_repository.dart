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

  /// Returns list [MangaModel] matching with the given [query] website.
  Future<ListMangaRemoteRepository> findMangaByQuery({String? query});

  /// Stores an manga to the local storage and returns the same [manga].
  Future<void> saveManga(MangaDetailModel manga);

  /// Deletes a manga from the local storage matching the given [endpoint].
  Future<void> deleteManga(String endpoint);

  /// Deletes all manga from the local storage.
  Future<void> deleteAllManga();

  Future<List<MangaDetailModel>> getAllManga();
}
