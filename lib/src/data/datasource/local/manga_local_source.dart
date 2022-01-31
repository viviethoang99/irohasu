import '../../model/manga_detail_model.dart';

abstract class MangaLocalSource {
  Stream<List<MangaDetailModel>> watchListManga({String getBy = 'all'});

  List<MangaDetailModel> getListManga();

  MangaDetailModel? getMangaDetail(String idManga);

  Future<void> saveManga(MangaDetailModel item);

  Future<void> updateById(MangaDetailModel item);

  Future<void> removeById(String id);

  Future<void> removeAll();
}
