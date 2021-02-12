import 'package:hive/hive.dart';
import 'package:irohasu/src/models/chapter_item_model.dart';
import 'package:irohasu/src/models/manga_model.dart';

class HistoryData {
  MangaModel cloneWith(MangaModel data) => MangaModel.mangaDetail(
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

  static void addChapToHistory(
      MangaModel data, int indexList, ChapterItem item) async {
    var mangaBox = Hive.box('irohasu');
    List listManga = (mangaBox.get('listManga', defaultValue: []));

    if (indexList == -1) {
      var cloneWith = MangaModel.mangaDetail(
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
      cloneWith.listChapRead.add(item);
      listManga.add(cloneWith);
    } else {
      listManga[indexList].listChapRead..add(item);
    }
    await mangaBox.put('listManga', listManga);
  }
}
