import 'package:hive/hive.dart';

part 'hive_setting_model.g.dart';

@HiveType(typeId: 0)
class HiveSettingModel {
  HiveSettingModel({
    this.readingMode,
    this.backgroundColorChapter,
  });

  @HiveField(0)
  String readingMode;
  @HiveField(1)
  String backgroundColorChapter;
  @HiveField(2)
  bool showPageNumberChapter;
  @HiveField(3)
  bool fullScreenChapter;
  @HiveField(4)
  String appTheme;
  @HiveField(5)
  String dateFormatApp;
  @HiveField(6)
  bool hideTitleMangaDetail;
}
