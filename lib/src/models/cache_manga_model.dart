import 'package:hive/hive.dart';
import '../models/manga_detail_model.dart';

part 'cache_manga_model.g.dart';

@HiveType(typeId: 3)
class CacheMangaModel {
  CacheMangaModel({required this.data, this.createTime});

  @HiveField(0)
  final DateTime? createTime;
  @HiveField(1)
  final MangaDetailModel data;
}
