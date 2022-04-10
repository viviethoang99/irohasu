import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

import '../../src/data/dtos/dtos.dart';
import 'dependency_injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit(initializerName: r'$registerDependencies')
Future<void> registerDependencies() async {
  _registerHiveTypeAdapters();
  await $registerDependencies(getIt);
}

void _registerHiveTypeAdapters() {
  Hive
    ..registerAdapter<MangaDetailDto>(MangaDetailDtoAdapter())
    ..registerAdapter<ChapterItemDto>(ChapterItemDtoAdapter())
    ..registerAdapter<GenresDto>(GenresDtoAdapter());
}
