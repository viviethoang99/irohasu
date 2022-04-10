import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/manga_detail.dart';
import '../../domain/repositories/i_manga_repository.dart';
import '../datasource/local/manga_local_source.dart';
import '../datasource/remote/manga_api_source.dart';
import '../dtos/dtos.dart';

@LazySingleton(as: IMangaRepository)
class MangaRepository implements IMangaRepository {
  const MangaRepository(
    this._mangaService,
    this._mangaLocalSource,
  );

  final IMangaApiSource _mangaService;
  final IMangaLocalSource _mangaLocalSource;

  @override
  Future<ListMangaRepository> findMangaByPage({int page = 1}) async {
    final response = await _mangaService.findMangaByPage(page: page);
    return response.fold(
      Left.new,
      (dto) => Right(dto.toEntities()),
    );
  }

  @override
  Future<ListMangaRepository> findMangaByQuery({String? query}) async {
    final response = await _mangaService.findMangaByQuery(query: query);
    return response.fold(
      Left.new,
      (dto) => Right(dto.toEntities()),
    );
  }

  @override
  Future<MangaDetailRepository> fetchMangaDetail(String endpoint) async {
    final mangaDetail = await _mangaService.findMangaDetail(endpoint);
    return mangaDetail.fold(
      Left.new,
      (manga) {
        saveManga(manga);
        return Right(manga.toEntity());
      },
    );
  }

  @override
  Future<void> saveManga(MangaDetailDto manga) {
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
  Future<List<MangaDetail>> getAllManga() async {
    final repository = await _mangaLocalSource.findAllManga();
    return repository.toEntities();
  }

  @override
  Stream<ListMangaDetail> watchAllManga() {
    return _mangaLocalSource
        .watchAllManga()
        .map((listManga) => listManga.toEntities());
  }
}
