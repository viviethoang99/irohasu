import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

@module
abstract class StorageModule {
  @preResolve
  @lazySingleton
  @Named('irohasu_iz_bezt_girl')
  Future<Box> get listMangaBox async {
    return Hive.openBox('irohasu_iz_bezt_girl');
  }

  @preResolve
  @lazySingleton
  @Named('shared_preferences')
  Future<Box> get settingBox async {
    return Hive.openBox<String>('shared_preferences');
  }
}
