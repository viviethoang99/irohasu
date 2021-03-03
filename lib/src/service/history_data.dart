import 'package:hive/hive.dart';
import 'package:irohasu/src/models/manga_detail_model.dart';

class HistoryData {
  static Future addChapToHistory(
    MangaDetailModel data,
    int indexItem,
    String idChapter,
  ) async {
    var mangaBox = Hive.box('irohasu');
    List listManga = mangaBox.get('listManga', defaultValue: []);

    var indexList =
        listManga.indexWhere((manga) => manga.idManga == data.idManga);
    if (indexList == -1) {
      var cloneManga = MangaDetailModel.mangaDetail(
        idManga: data.idManga,
        title: data.title,
        endpoint: data.endpoint,
        thumbnailUrl: data.thumbnailUrl,
        author: data.author,
        description: data.description,
        dislike: data.dislike,
        like: data.like,
        listChapter: data.listChapter,
        status: data.status,
      );
      cloneManga.listChapRead.add(idChapter);
      cloneManga.listChapter[indexItem].isReading = true;
      listManga.add(cloneManga);
    } else {
      listManga[indexList].listChapRead.add(idChapter);
      listManga[indexList].listChapter[indexItem].isReading = true;
    }
    await mangaBox.put('listManga', listManga);
  }
}
