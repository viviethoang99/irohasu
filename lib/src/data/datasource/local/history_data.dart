import 'package:flutter/foundation.dart';
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
      listManga[idManga].chapter.listChapRead
        ..removeWhere((id) => id == idChapter)
        ..add(idChapter);
      listManga[idManga].chapter.listChapter.map((chapter) {
        if (idChapter == chapter.id) {
          chapter
            ..isReading = true
            ..timeReading = DateTime.now();
        }
      }).toList();
      await mangaBox.put('listManga', listManga);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  static Future<bool> removeHistory(
      {String? idChapter, String? idManga}) async {
    final mangaBox = Hive.box('irohasu');
    final listManga = mangaBox.get('listManga', defaultValue: {});
    final _cacheManagerData = CacheManagerData();

    if (idChapter == 'all') {
      if (listManga[idManga].chapter.isFavorite != true &&
          listManga[idManga].chapter.listDownload.isEmpty) {
        await _cacheManagerData.removeMangaRequestSingleCache(idManga);
        return true;
      }
      listManga[idManga]
        ..chapter.listChapRead = <String>[]
        ..chapter
            .listChapter
            .map((chapter) => chapter
              ..isReading = false
              ..timeReading = null)
            .toList();
      await mangaBox.put('listManga', listManga);
      return true;
    } else if (idChapter!.isNotEmpty) {
      listManga[idManga].chapter
        ..listChapRead.removeLast()
        ..listChapter.map((chapter) {
          if (idChapter == chapter.id) {
            chapter
              ..isReading = false
              ..timeReading = null;
          }
        }).toList();
      await mangaBox.put('listManga', listManga);
      return true;
    }
    return false;
  }
}
