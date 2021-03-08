import 'package:hive/hive.dart';
import '../models/manga_detail_model.dart';

class HistoryData {
  static Future addChapToHistory(
    MangaDetailModel data,
    int indexItem,
    String idChapter,
  ) async {
    var mangaBox = Hive.box('irohasu');
    final listManga = mangaBox.get('listManga', defaultValue: {});

    listManga[data.idManga].data.listChapRead.add(idChapter);
    listManga[data.idManga].data.listChapter[indexItem].isReading = true;
    await mangaBox.put('listManga', listManga);
  }
}
