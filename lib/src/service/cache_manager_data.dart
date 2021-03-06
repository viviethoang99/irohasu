import 'package:hive/hive.dart';
import '../models/cache_manga_model.dart';
import '../models/manga_detail_model.dart';

abstract class IFileManager {
  Future<bool> writeMangaRequestDataWithTime(MangaDetailModel body);

  Future<CacheMangaModel> getMangaRequestData(String idManga);

  Future<bool> removeMangaRequestSingleCache(String idManga);

  Future<bool> removeMangaRequestCache();
}

class CacheManagerData extends IFileManager {
  // CacheManagerData._(this._box);

  final _irohasu = 'irohasu';
  final _listManga = 'listManga';

  // final Box<dynamic> _box;
  //
  // Future<CacheManagerData> getInstance() async {
  //   final box = await Hive.openBox<dynamic>(_irohasu)
  //     ..get(_listManga, defaultValue: {});
  //   return CacheManagerData._(box);
  // }

  @override
  Future<CacheMangaModel> getMangaRequestData(String idManga) async {
    var mangaBox = Hive.box(_irohasu);
    var manga = mangaBox?.get(_listManga, defaultValue: {});
    if (manga.containsKey(idManga)) return manga[idManga];
    return null;
  }

  @override
  Future<bool> removeMangaRequestCache() async {
    try {
      var mangaBox = Hive.box(_irohasu);
      await mangaBox?.put(_listManga, {});
      print('Remove all Manga: Success');
      return true;
    } catch (e) {
      print('Cant remove all history Manga: $e');
      return false;
    }
  }

  @override
  Future<bool> removeMangaRequestSingleCache(String idManga) async {
    var mangaBox = Hive.box(_irohasu);
    var listManga = mangaBox?.get(_listManga, defaultValue: {});
    try {
      listManga.remove(idManga);
      await mangaBox.put(_listManga, listManga);
      return true;
    } catch (e) {
      print('Cant remove Manga');
      return false;
    }
  }

  @override
  Future<bool> writeMangaRequestDataWithTime(MangaDetailModel body) async {
    try {
      var mangaBox = Hive.box(_irohasu);
      var listManga = mangaBox?.get(_listManga, defaultValue: {});
      listManga[body.idManga] = CacheMangaModel(
        createTime: DateTime.now(),
        data: body,
      );
      await mangaBox.put(_listManga, listManga);
      return true;
    } catch (e) {
      print('Can not write Manga request');
      return false;
    }
  }
}
