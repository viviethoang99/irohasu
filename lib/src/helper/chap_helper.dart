import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

import '../extensions/string_extension.dart';
import '../models/chapter_item_model.dart';

class ChapHelper {
  static ChapterItem getChapterLastReading(String idManga) {
    var mangaBox = Hive.box('irohasu');
    final cacheManga = mangaBox?.get('listManga', defaultValue: {})[idManga];
    final listChapterReading = cacheManga.data.listChapRead.last;
    final item = cacheManga.data.listChapter
        .firstWhere((element) => element.idChapter == listChapterReading);
    return item;
  }

  static ChapterItem getChapterItem({String idManga, String idChapter}) {
    var mangaBox = Hive.box('irohasu');
    final cacheManga = mangaBox?.get('listManga', defaultValue: {})[idManga];
    final item = cacheManga.data.listChapter
        .firstWhere((element) => element.idChapter == idChapter);
    return item;
  }

  static String removeNameManga({
    @required String titleChapter,
    @required nameManga,
  }) => titleChapter.replaceAll(nameManga, '').trim().capitalize();
}
