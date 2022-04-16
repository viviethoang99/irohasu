import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

import '../../../src/data/dtos/dtos.dart';


@module
abstract class StorageModule {
  @preResolve
  @lazySingleton
  @Named('irohasu_iz_bezt_girl')
  Future<Box<MangaDetailDto>> get listMangaBox async {
    return Hive.openBox<MangaDetailDto>('irohasu_iz_bezt_girl');
  }

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
}
