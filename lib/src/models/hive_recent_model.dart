import 'package:hive/hive.dart';
import 'package:irohasu/src/models/chapter_list_model.dart';

part 'hive_recent_model.g.dart';

@HiveType(typeId: 1)
class HiveRecentModel extends HiveObject {
  HiveRecentModel({this.idManga, this.listChapRead});

  static const recentBox = 'recentBox';

  @HiveField(0)
  String idManga;
  @HiveField(1)
  List<ChapterList> listChapRead;

}
