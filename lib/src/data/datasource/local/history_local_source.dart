import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import '../../model/manga_detail_model.dart';

const String _cacheListManga = 'CACHED_LIST_MANGA';

abstract class IHiveLocalSource {
  Future<void> saveMangaToLocal();

  Future<MangaDetailModel> findMangaByEndpoint(String endpoint);

  Future<void> removeMangaByEndpoint(String endpoint);
}

@injectable
class HistoryLocalSourceImp implements IHiveLocalSource {
  const HistoryLocalSourceImp(
    @Named('irohasu_iz_bezt_girl') this._box,
  );

  final Box _box;

  @override
  Future<MangaDetailModel> findMangaByEndpoint(String endpoint) {
    // TODO: implement findMangaByEndpoint
    throw UnimplementedError();
  }

  @override
  Future<void> removeMangaByEndpoint(String endpoint) {
    // TODO: implement removeMangaByEndpoint
    throw UnimplementedError();
  }

  @override
  Future<void> saveMangaToLocal() {
    // TODO: implement saveMangaToLocal
    throw UnimplementedError();
  }
}
