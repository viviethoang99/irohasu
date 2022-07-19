import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';


import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
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
  Future<ListMangaDetailRepository> getAllManga() async {
    try {
      final repository = _mangaLocalSource.findAllManga();
      return right(repository.toEntities());
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Stream<ListMangaDetailRepository> watchAllManga(List<String> listId) {
    return _mangaLocalSource.watchAllManga(listId).map(
          (repository) => repository.fold(
            (error) => Left(CacheFailure()),
            (listManga) => Right(listManga.toEntities()),
          ),
        );
  }

  @override
  Future<ListMangaDetailRepository> findMangaLibrary(
      List<String> listId) async {
    try {
      final repository = _mangaLocalSource.findMangaByQuery(listId);
      return right(repository.toEntities());
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}
