import 'dart:async';

import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';
import '../../data/dtos/dtos.dart';
import '../entities/manga.dart';
import '../entities/manga_detail.dart';

typedef MangaDetailRepository = Either<Failure, MangaDetail>;

typedef ListMangaDetailRepository = Either<Failure, ListMangaDetail>;

typedef ListMangaRepository = Either<Failure, ListManga>;

abstract class IMangaRepository {
  /// Returns [MangaDetail]s matching with the given [endpoint].
  Future<MangaDetailRepository> fetchMangaDetail(String endpoint);

  /// Returns list [Manga] matching with the given [page] website.
  Future<ListMangaRepository> findMangaByPage({int page});

  /// Returns list [Manga] matching with the given [query] website.
  Future<ListMangaRepository> findMangaByQuery({String? query});

  /// Stores an manga to the local storage and returns the same [manga].
  Future<void> saveManga(MangaDetailDto manga);

  /// Deletes a manga from the local storage matching the given [endpoint].
  Future<void> deleteManga(String endpoint);

  /// Deletes all manga from the local storage.
  Future<void> deleteAllManga();

  Future<ListMangaDetailRepository> getAllManga();

  Future<ListMangaDetailRepository> findMangaLibrary(List<String> listId);

  /// Returns stream of [ListMangaDetail] by listening to updates in the local
  /// storage.
  Stream<ListMangaDetailRepository> watchAllManga(List<String> listId);
}
