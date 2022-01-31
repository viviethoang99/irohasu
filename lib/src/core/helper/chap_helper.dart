import 'package:hive/hive.dart';
import '../../data/model/chapter_item_model.dart';

import '../extensions/string_extension.dart';

class ChapHelper {
  static ChapterItem? getChapterLastReading(String? idManga) {
    var mangaBox = Hive.box('irohasu');
    final cacheManga = mangaBox.get('listManga', defaultValue: {})[idManga];
    final listChapterReading = cacheManga.chapter.listChapRead.last;
    final item = cacheManga.chapter.listChapter
        .firstWhere((element) => element.id == listChapterReading);
    return item;
  }

  static ChapterItem? getChapterItem({String? idManga, String? idChapter}) {
    var mangaBox = Hive.box('irohasu');
    final cacheManga = mangaBox.get('listManga', defaultValue: {})[idManga];
    final item = cacheManga.chapter.listChapter
        .firstWhere((element) => element.id == idChapter);
    return item;
  }

  static String removeNameManga({
    required String titleChapter,
    required nameManga,
  }) =>
      titleChapter.replaceAll(nameManga, '').trim().capitalize();
}
