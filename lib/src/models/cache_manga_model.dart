import 'package:hive/hive.dart';
import 'package:irohasu/src/models/manga_detail_model.dart';

part 'cache_manga_model.g.dart';

@HiveType(typeId: 3)
class CacheMangaModel {
  CacheMangaModel({this.data, this.createTime}) : assert(data != null);

  @HiveField(0)
  final DateTime createTime;
  @HiveField(1)
  final MangaDetailModel data;
}
