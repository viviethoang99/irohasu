import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

import '../../src/data/model/chapter_item_model.dart';
import '../../src/data/model/genres_model.dart';
import '../../src/data/model/manga_detail_model.dart';

import 'dependency_injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit(initializerName: r'$registerDependencies')
Future<void> registerDependencies() async {
  _registerHiveTypeAdapters();
  await $registerDependencies(getIt);
}

void _registerHiveTypeAdapters() {
  Hive
    ..registerAdapter<MangaDetailModel>(MangaDetailModelAdapter())
    ..registerAdapter<ChapterItem>(ChapterItemAdapter())
    ..registerAdapter<Genres>(GenresAdapter());
}
