import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';

import '../../../features/chapter/chapter.dart';
import '../../../features/manga/data/data.dart';

@module
abstract class StorageModule {
  @preResolve
  @lazySingleton
  @Named('setting_box')
  Future<Box<String>> get settingBox async {
    return Hive.openBox<String>('setting_box');
  }

  @preResolve
  @lazySingleton
  @Named('favorite_box')
  Future<Box<List<String>>> get favoriteBox async {
    return Hive.openBox<List<String>>('favorite_box');
  }

  @preResolve
  @lazySingleton
  @Named('irohasu_is_bezt_girl')
  Future<Isar> get chapterBox async {
    return Isar.open([ChapterDtoSchema, MangaDetailDtoSchema]);
  }
}
