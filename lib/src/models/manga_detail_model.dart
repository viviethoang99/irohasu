import 'package:hive/hive.dart';

import 'chapter_item_model.dart';
import 'genres_model.dart';

part 'manga_detail_model.g.dart';

@HiveType(typeId: 0)
class MangaDetailModel {
  MangaDetailModel(
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
      this.thumbnailUrl,
      this.listGenres});

  factory MangaDetailModel.fromMap(Map<String, dynamic> json) =>
      MangaDetailModel(
        idManga: json['idManga'] as String,
        title: json['title'] as String,
        thumbnailUrl: json['urlThumb'] as String,
        endpoint: json['endpoint'] as String,
        status: json['status'] as String,
        author: json['author'].join(','),
        description: json['description'] as String,
        dislike: json['totalLike']['TotalDisLike'] as String,
        like: json['totalLike']['TotalLike'] as String,
        listChapter: List<ChapterItem>.from(json['listChapter']
            ?.map<ChapterItem>((item) => ChapterItem.fromJson(json: item))),
        listGenres: List<Genres>.from(json['listGenres']
            ?.map<Genres>((item) => Genres.fromJson(json: item))),
      );

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
  List<String> listChapRead = [];
  @HiveField(12)
  List<String> listDownload = [];
  @HiveField(13)
  List<Genres> listGenres;
}
