import 'package:hive/hive.dart';

class FavoriteData {
  static void isFavorite(String idManga) async {
    // Open DB
    final mangaBox = Hive.box('irohasu');
    final listManga = mangaBox.get('listManga', defaultValue: {});
    // Change favorite
    if (listManga[idManga].data.isFavorite == null) {
      listManga[idManga].data.isFavorite = true;
    } else {
      listManga[idManga].data.isFavorite = !listManga[idManga].data.isFavorite;
    }
    // Save Database
    await mangaBox.put('listManga', listManga);
  }
}
