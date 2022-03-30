import 'package:hive/hive.dart';

import '../../../../env.dart';
import '../../model/cache_manga_model.dart';
import '../../model/manga_detail_model.dart';

abstract class IFileManager {
  Future<bool> writeMangaRequestDataWithTime(MangaDetailModel body);

  Future<CacheMangaModel?> getMangaRequestData(String idManga);

  Future<bool> removeMangaRequestSingleCache(String idManga);

  Future<bool> removeMangaRequestCache();
}

class CacheManagerData extends IFileManager {
  // CacheManagerData._(this._box);

  final _listManga = 'listManga';

  // final Box<dynamic> _box;
  //
  // Future<CacheManagerData> getInstance() async {
  //   final box = await Hive.openBox<dynamic>(_irohasu)
  //     ..get(_listManga, defaultValue: {});
  //   return CacheManagerData._(box);
  // }

  @override
  Future<CacheMangaModel?> getMangaRequestData(String? idManga) async {
    var mangaBox = Hive.box(ENV.nameDatabase);
    var manga = mangaBox.get(_listManga, defaultValue: {});
    if (manga.containsKey(idManga)) return manga[idManga];
    return null;
  }

  @override
  Future<bool> removeMangaRequestCache() async {
    try {
      var mangaBox = Hive.box(ENV.nameDatabase);
      await mangaBox.put(_listManga, {});
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> removeMangaRequestSingleCache(String? idManga) async {
    var mangaBox = Hive.box(ENV.nameDatabase);
    var listManga = mangaBox.get(_listManga, defaultValue: {});
    try {
      listManga.remove(idManga);
      await mangaBox.put(_listManga, listManga);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> writeMangaRequestDataWithTime(MangaDetailModel body) async {
    try {
      var mangaBox = Hive.box(ENV.nameDatabase);
      var listManga = mangaBox.get(_listManga, defaultValue: {});
      listManga[body.idManga] = CacheMangaModel(
        createTime: DateTime.now(),
        data: body,
      );
      await mangaBox.put(_listManga, listManga);
      return true;
    } catch (e) {
      return false;
    }
  }
}
