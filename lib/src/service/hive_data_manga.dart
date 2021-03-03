import 'package:hive/hive.dart';
import 'package:irohasu/src/models/manga_detail_model.dart';

class HiveDataManga {
  Future<int> addMangaToDatabase({MangaDetailModel data}) async {
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
      listManga.add(cloneManga);
      await mangaBox.put('listManga', listManga);
      return (listManga.length - 1);
    }
    return indexList;
  }
}
