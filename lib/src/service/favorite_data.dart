import 'package:hive/hive.dart';
import 'package:irohasu/src/models/manga_detail_model.dart';

class FavoriteData {
  static void saveFavorite(MangaDetailModel mangaModel) async {
    // Open DB
    final mangaBox = Hive.box('irohasu');
    int _isFavorite;
    // Get value
    List listManga = mangaBox.get('listManga', defaultValue: []);
    _isFavorite =
        listManga.indexWhere((manga) => manga.idManga == mangaModel.idManga);
    if (_isFavorite < 0) {
      mangaModel.isFavorite = true;
      listManga.add(mangaModel);
    } else {
      listManga[_isFavorite].isFavorite = true;
    }
    await mangaBox.put('listManga', listManga);
  }

  static Future<void> unFavorite(String idManga) async {
    // Open DB
    final mangaBox = Hive.box<dynamic>('irohasu');
    var _isFavorite = 0;

    // Get value
    List listManga = mangaBox.get('listManga', defaultValue: []);

    // Check isFavorite?
    _isFavorite = listManga.indexWhere((manga) => manga.idManga == idManga);
    var mangaModel = listManga[_isFavorite];
    if (mangaModel.listChapter.isNotEmpty ||
        mangaModel.listChapRead.isNotEmpty) {
      listManga[_isFavorite].isFavorite = false;
    } else {
      listManga.removeAt(_isFavorite);
    }
    await mangaBox.put('listManga', listManga);
  }
}
