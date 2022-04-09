import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/core.dart';
import '../../model/manga_detail_model.dart';

abstract class IMangaLocalSource {
  /// Returns all [MangaDetailModel] in the local storage.
  Future<List<MangaDetailModel>> findAllManga();

  /// Returns [MangaDetailModel] matching the given [endpoint].
  Future<MangaDetailModel?> findAlbumDetail(String endpoint);

  /// Stores an [manga] to the local storage and returns the same [manga].
  Future<void> saveManga(MangaDetailModel manga);

  /// Deletes a manga from the local storage matching the given [endpoint].
  Future<void> deleteManga(String endpoint);

  /// Deletes all manga from the local storage.
  Future<void> deleteAllManga();
}

@Injectable(as: IMangaLocalSource)
class MangaLocalSource implements IMangaLocalSource {
  const MangaLocalSource(
    @Named('irohasu_iz_bezt_girl') this._box,
  );

  final Box<MangaDetailModel> _box;

  @override
  Future<MangaDetailModel?> findAlbumDetail(String endpoint) async {
    return _box.get(endpoint.toId);
  }

  @override
  Future<List<MangaDetailModel>> findAllManga() async {
    return _box.values.toList();
  }

  @override
  Future<void> saveManga(MangaDetailModel manga) async {
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
}