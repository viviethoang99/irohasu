import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import '../../../core/extensions/extensions.dart';
import '../../model/manga_detail_model.dart';
import 'manga_local_source.dart';

@injectable
class MangaLocalSourceImp implements MangaLocalSource {
  const MangaLocalSourceImp(
    @Named('irohasu_iz_bezt_girl') this._box,
  );

  static const _key = 'com.irohasu_iz_bezt_girl.list_manga';

  final Box _box;

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
