import 'package:hive_flutter/hive_flutter.dart';
import 'package:rxdart/rxdart.dart';

import '../../env.dart';
import '../extensions/map_extension.dart';
import '../models/manga_detail_model.dart';
import 'manga_local_source.dart';

class MangaLocalSourceImp implements MangaLocalSource {
  const MangaLocalSourceImp._(this._box);

  static const _key = 'com.irohasu_iz_bezt_girl.list_manga';

  final Box _box;

  static Future<MangaLocalSourceImp> getInstance() async {
    final box = await Hive.openBox(ENV.nameDatabase);
    return MangaLocalSourceImp._(box);
  }

  @override
  Future<void> removeAll() => _box.put(_key, <String, dynamic>{});

  @override
  Future<void> removeById(String id) async {
    final listManga = _box.get(_key, defaultValue: <String, dynamic>{});
    listManga?.remove(id);
    await _box.put(_key, listManga!);
  }

  @override
  Future<void> saveManga(MangaDetailModel item) async {
    final listManga = _box.get(_key, defaultValue: <String, dynamic>{});
    listManga![item.idManga] = item.copyWith(lastRead: DateTime.now());
    await _box.put(_key, listManga);
  }

  @override
  Future<void> updateById(MangaDetailModel item) async {
    final listManga = _box.get(_key, defaultValue: <String, dynamic>{});
    listManga![item.idManga] = item.copyWith(lastRead: DateTime.now());
  }

  @override
  Stream<List<MangaDetailModel>> watchListManga({String getBy = 'all'}) {
    return _box
        .watch()
        .map((event) => getListManga())
        .startWith(getListManga());
  }

  @override
  List<MangaDetailModel> getListManga() {
    final listManga = _box.get(_key, defaultValue: <String, dynamic>{}) as Map;
    return listManga.toList((e) => e.value);
  }

  @override
  MangaDetailModel? getMangaDetail(String idManga) {
    final listManga = _box.get(_key, defaultValue: <String, dynamic>{});
    return listManga[idManga];
  }
}
