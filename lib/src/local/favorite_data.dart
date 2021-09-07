import 'package:hive/hive.dart';

class FavoriteData {
  static void isFavorite(String? idManga) async {
    // Open DB
    final mangaBox = Hive.box('irohasu');
    final listManga = mangaBox.get('listManga', defaultValue: {});
    // Change favorite
    if (listManga[idManga].chapter.isFavorite == null) {
      listManga[idManga].chapter.isFavorite = true;
    } else {
      listManga[idManga].chapter.isFavorite = !listManga[idManga].chapter.isFavorite;
    }
    // Save Database
    await mangaBox.put('listManga', listManga);
  }
}
