import 'package:hive/hive.dart';

class HistoryData {
  static Future addChapToHistory({
    String idManga,
    String idChapter,
  }) async {
    final mangaBox = Hive.box('irohasu');
    final listManga = mangaBox.get('listManga', defaultValue: {});

    if (!listManga[idManga].data.listChapRead.contains(idChapter)) {
      listManga[idManga].data.listChapRead.add(idChapter);
      listManga[idManga].data.listChapter.map((chapter) {
        if (idChapter == chapter.idChapter)
          chapter
            ..isReading = true
            ..timeReading = DateTime.now();
      }).toList();
      await mangaBox.put('listManga', listManga);
    } else
      return null;
  }

  static Future<bool> removeHistory({String idChapter, String idManga}) async {
    final mangaBox = Hive.box('irohasu');
    final listManga = mangaBox.get('listManga', defaultValue: {});

    if (idChapter == 'all') {
      listManga[idManga]
        ..data.listChapRead = []
        ..data
            .listChapter
            .map((chapter) => chapter
              ..isReading = false
              ..timeReading = null)
            .toList();
      await mangaBox.put('listManga', listManga);
      return true;
    } else if (idChapter.isNotEmpty) {
      listManga[idManga].data
        ..listChapRead.removeLast()
        ..listChapter.map((chapter) {
          if (idChapter == chapter.idChapter)
            chapter
              ..isReading = false
              ..timeReading = null;
        }).toList();
      await mangaBox.put('listManga', listManga);
      return true;
    }
    return false;
  }
}
