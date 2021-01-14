import 'package:hive/hive.dart';

part 'hive_chapter_opened_model.g.dart';

@HiveType(typeId: 1)
class HiveChapterOpenedModel {
  HiveChapterOpenedModel(
      {this.lastChapter, this.mangaEndpoint, this.chapterEndpoint});

  @HiveField(0)
  int lastChapter;
  @HiveField(1)
  String mangaEndpoint;
  @HiveField(2)
  String chapterEndpoint;
}
