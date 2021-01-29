import 'package:meta/meta.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

import 'chapter_item_model.dart';

part 'manga_model.g.dart';

@HiveType(typeId: 0)
class MangaModel {
  MangaModel();

  MangaModel.mangaDetail({
    @required this.idManga,
    @required this.title,
    @required this.thumbnailUrl,
    @required this.status,
    @required this.author,
    @required this.description,
    @required this.dislike,
    @required this.like,
    @required this.endpoint,
    // @required this.theme,
    @required this.listChapter,
    this.isFavorite = false,
  });

  MangaModel.generalSettings({
    @required this.idManga,
    @required this.title,
    @required this.thumbnailUrl,
    @required this.endpoint,
  });

  static const mangaBox = 'mangaBox';

  @HiveField(0)
  String idManga;
  @HiveField(1)
  String title;
  @HiveField(2)
  String thumbnailUrl;
  @HiveField(3)
  String endpoint;
  @HiveField(4)
  String description;
  @HiveField(5)
  String dislike;
  @HiveField(6)
  String like;
  @HiveField(7)
  String status;
  @HiveField(8)
  String author;
  @HiveField(9)
  List<ChapterItem> listChapter;
  @HiveField(10)
  bool isFavorite;
  @HiveField(11)
  List<ChapterItem> listChapRead = [];
  @HiveField(12)
  List<ChapterItem> listDownload = [];

  Future<void> saveManga(String idManga, bool isFavorite) async {
    final mangaBox = Hive.box<MangaModel>(MangaModel.mangaBox);

    var mangaDetail = mangaBox.get(idManga)..isFavorite = !isFavorite;

    await mangaBox.put(idManga, mangaDetail);
  }
}
