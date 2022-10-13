import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';

import '../../../../../core/core.dart';
import '../../dtos/dtos.dart';

typedef ListMangaDetailDtoLocal = Either<CacheFailure, ListMangaDetailDto>;

abstract class IMangaLocalSource {
  /// Returns all [MangaDetailDto] in the local storage.
  Future<List<MangaDetailDto>> findMangaByOffset(int offset);

  /// Returns list [MangaDetailDto] by query in the local storage.
  Future<List<MangaDetailDto?>> findMangaByQuery(List<int> listId);

  /// Returns [MangaDetailDto] matching the given [id].
  Future<MangaDetailDto?> findMangaDetail(int id);

  /// Stores an [manga] to the local storage and returns the same [manga].
  Future<void> saveManga(MangaDetailDto manga);

  /// Deletes a manga from the local storage matching the given [endpoint].
  Future<void> deleteManga(int id);

  /// Deletes all manga from the local storage.
  Future<void> deleteAllManga();

  /// Returns a stream of list of [MangaDetailDto] stored in local storage.
  ///
  /// A new event will be emitted whenever an [MangaDetail] is updated,
  /// removed, or a new [MangaDetailDto] is stored.
  Stream<ListMangaDetailDtoLocal> watchAllManga(List<int> listId);
}

@Injectable(as: IMangaLocalSource)
class MangaLocalSource implements IMangaLocalSource {
  const MangaLocalSource(
    @Named('irohasu_is_bezt_girl') this._isar,
  );

  final Isar _isar;

  @override
  Future<MangaDetailDto?> findMangaDetail(int id) async {
    return _isar.mangaDetailDtos.where().idMangaEqualTo(id).findFirst();
  }

  @override
  Future<List<MangaDetailDto>> findMangaByOffset(int offset) {
    return _isar.mangaDetailDtos.where().offset(offset).limit(10).findAll();
  }

  @override
  Future<void> saveManga(MangaDetailDto manga) async {
    return _isar.writeTxnSync(() => _isar.mangaDetailDtos.putSync(manga));
  }

  @override
  Future<void> deleteManga(int id) {
    return _isar.writeTxnSync(() => _isar.mangaDetailDtos.delete(id));
  }


  @override
  Future<List<MangaDetailDto?>> findMangaByQuery(List<int> listId) async {
    return _isar.mangaDetailDtos.getAll(listId);
  }
  
  @override
  Future<void> deleteAllManga() {
    // TODO: implement deleteAllManga
    throw UnimplementedError();
  }
  
  @override
  Stream<ListMangaDetailDtoLocal> watchAllManga(List<int> listId) {
    // TODO: implement watchAllManga
    throw UnimplementedError();
  }
}
