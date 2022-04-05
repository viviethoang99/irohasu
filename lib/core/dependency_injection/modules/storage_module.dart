import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

import '../../../src/data/model/manga_detail_model.dart';

@module
abstract class StorageModule {
  @lazySingleton
  @Named('irohasu_iz_bezt_girl')
  Future<Box<MangaDetailModel>> get listMangaBox async {
    return Hive.openBox<MangaDetailModel>('irohasu_iz_bezt_girl');
  }

  @preResolve
  @lazySingleton
  @Named('setting_box')
  Future<Box<String>> get settingBox async {
    return Hive.openBox<String>('setting_box');
  }

  @lazySingleton
  @Named('favorite_box')
  Future<Box<List<String>>> get favoriteBox async {
    return Hive.openBox<List<String>>('favorite_box');
  }
}
