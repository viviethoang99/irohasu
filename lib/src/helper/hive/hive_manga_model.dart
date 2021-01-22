import 'package:hive/hive.dart';

part 'hive_manga_model.g.dart';

@HiveType(typeId: 0)
class HiveMangaModel{
  HiveMangaModel({this.mangaEndpoint, this.thumb, this.title, this.idManga});

  static const mangaBox = 'mangaBox';

  @HiveField(0)
  String mangaEndpoint;
  @HiveField(1)
  String thumb;
  @HiveField(2)
  String title;
  @HiveField(3)
  String idManga;

}