import 'package:meta/meta.dart';
import 'package:hive/hive.dart';

import 'chapter_item_model.dart';

part 'manga_model.g.dart';

@HiveType(typeId: 0)
class MangaModel {
  MangaModel(
      {this.idManga,
      this.title,
      this.isFavorite,
      this.status,
      this.listChapter,
      this.author,
      this.like,
      this.dislike,
      this.description,
      this.endpoint,
      this.thumbnailUrl});

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

  factory MangaModel.fromJsonDetail(Map<String, dynamic> json) => MangaModel(
        idManga: json['idManga'] as String,
        title: json['title'] as String,
        thumbnailUrl: json['urlThumb'] as String,
        endpoint: json['endpoint'] as String,
        status: json['status'] as String,
        author: (json['author'] as List<dynamic>)
            .map((dynamic item) => item.toString())
            .toList()
            .join(','),
        description: json['description'] as String,
        dislike: json['totalLike']['TotalDisLike'] as String,
        like: json['totalLike']['TotalLike'] as String,
        listChapter: List<ChapterItem>.from(
            (json['listChapter'] as List<dynamic>).map<ChapterItem>(
                (dynamic item) =>
                    ChapterItem.fromJson(json: item as Map<String, dynamic>))),
      );

  factory MangaModel.fromJsonGeneral(Map<String, dynamic> json) => MangaModel(
        idManga: json['idManga'] as String,
        title: json['title'] as String,
        thumbnailUrl: json['thumb'] as String,
        endpoint: json['endpoint'] as String,
      );

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

  static Future<void> clearCache() async {
    final box = await Hive.openBox<MangaModel>(MangaModel.mangaBox);
    await box.clear();
  }
}
