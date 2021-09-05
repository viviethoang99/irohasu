import 'package:hive/hive.dart';
import 'cache_manager_data.dart';

class HistoryData {
  static Future addChapToHistory({
    String? idManga,
    String? idChapter,
  }) async {
    final mangaBox = Hive.box('irohasu');
    final listManga = mangaBox.get('listManga', defaultValue: {});

    try {
      listManga[idManga].data.listChapRead
        ..removeWhere((id) => id == idChapter)
        ..add(idChapter);
      listManga[idManga].data.listChapter.map((chapter) {
        if (idChapter == chapter.idChapter) {
          chapter
            ..isReading = true
            ..timeReading = DateTime.now();
        }
      }).toList();
      await mangaBox.put('listManga', listManga);
    } catch (e) {
      print(e);
    }
  }

  static Future<bool> removeHistory(
      {String? idChapter, String? idManga}) async {
    final mangaBox = Hive.box('irohasu');
    final listManga = mangaBox.get('listManga', defaultValue: {});
    final _cacheManagerData = CacheManagerData();

    if (idChapter == 'all') {
      if (listManga[idManga].data.isFavorite != true &&
          listManga[idManga].data.listDownload.isEmpty) {
        await _cacheManagerData.removeMangaRequestSingleCache(idManga);
        print('remove Manga success');
        return true;
      }
      listManga[idManga]
        ..data.listChapRead = <String>[]
        ..data
            .listChapter
            .map((chapter) => chapter
              ..isReading = false
              ..timeReading = null)
            .toList();
      await mangaBox.put('listManga', listManga);
      print('clear all chapter');
      return true;
    } else if (idChapter!.isNotEmpty) {
      listManga[idManga].data
        ..listChapRead.removeLast()
        ..listChapter.map((chapter) {
          if (idChapter == chapter.idChapter) {
            chapter
              ..isReading = false
              ..timeReading = null;
          }
        }).toList();
      await mangaBox.put('listManga', listManga);
      print('clear chapter');
      return true;
    }
    return false;
  }
}
