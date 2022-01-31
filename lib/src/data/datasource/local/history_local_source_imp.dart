import 'package:hive_flutter/hive_flutter.dart';

import '../../../../env.dart';
import 'hive_local_source.dart';

class HistoryLocalSourceImp implements HiveLocalSource {
  const HistoryLocalSourceImp._(this._box);

  static const _key = 'com.irohasu_iz_bezt_girl.chapter_read';

  final Box _box;

  static Future<HistoryLocalSourceImp> getInstance() async {
    final box = await Hive.openBox(ENV.nameDatabase);
    return HistoryLocalSourceImp._(box);
  }

  @override
  Future<List> getList({String? idManga}) async {
    final listManga = _box.get(_key, defaultValue: <String, dynamic>{});
    return listManga?[idManga] ?? <String>[];
  }

  @override
  Future<void> removeAll() => _box.put(_key, <String, dynamic>{});

  @override
  Future removeItem({String? idManga, String? idChapter}) async {
    final listManga = _box.get(_key, defaultValue: <String, dynamic>{});
    listManga?[idManga].remove(idChapter);
    await _box.put(_key, listManga ?? <String, dynamic>{});
  }

  @override
  Future<void> removeList({String? idManga}) async {
    final listManga = _box.get(_key, defaultValue: <String, dynamic>{});
    listManga?.remove(idManga);
    await _box.put(_key, listManga ?? <String, dynamic>{});
  }

  @override
  Future addList({List? listData, String? idManga}) async {
    final listManga = _box.get(_key, defaultValue: <String, dynamic>{});
    listManga?[idManga!] = listData;
    await _box.put(_key, listManga!);
  }

  @override
  Future getDataKey() async {
    return _box.get(_key, defaultValue: <String, dynamic>{}) as Map;
  }
}
