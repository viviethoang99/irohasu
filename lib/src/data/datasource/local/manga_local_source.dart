import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/core.dart';
import '../../../domain/entities/manga_detail.dart';
import '../../dtos/dtos.dart';

abstract class IMangaLocalSource {
  /// Returns all [MangaDetailDto] in the local storage.
  Future<List<MangaDetailDto>> findAllManga();

  /// Returns [MangaDetailDto] matching the given [endpoint].
  Future<MangaDetailDto?> findAlbumDetail(String endpoint);

  /// Stores an [manga] to the local storage and returns the same [manga].
  Future<void> saveManga(MangaDetailDto manga);

  /// Deletes a manga from the local storage matching the given [endpoint].
  Future<void> deleteManga(String endpoint);

  /// Deletes all manga from the local storage.
  Future<void> deleteAllManga();

  /// Returns a stream of list of [MangaDetailDto] stored in local storage.
  ///
  /// A new event will be emitted whenever an [MangaDetail] is updated,
  /// removed, or a new [MangaDetailDto] is stored.
  Stream<List<MangaDetailDto>> watchAllManga();
}

@Injectable(as: IMangaLocalSource)
class MangaLocalSource implements IMangaLocalSource {
  const MangaLocalSource(
    @Named('irohasu_iz_bezt_girl') this._box,
  );

  final Box<MangaDetailDto> _box;

  @override
  Future<MangaDetailDto?> findAlbumDetail(String endpoint) async {
    return _box.get(endpoint.toId);
  }

  @override
  Future<List<MangaDetailDto>> findAllManga() async {
    return _box.values.toList();
  }

  @override
  Future<void> saveManga(MangaDetailDto manga) async {
    return _box.put(manga.endpoint.toId, manga);
  }

  @override
  Future<void> deleteManga(String endpoint) {
    return _box.delete(endpoint.toId);
  }

  @override
  Future<void> deleteAllManga() {
    return _box.clear();
  }

  @override
  Stream<List<MangaDetailDto>> watchAllManga() {
    return _box.watch().map((_) => _box.values.toList());
  }
}
