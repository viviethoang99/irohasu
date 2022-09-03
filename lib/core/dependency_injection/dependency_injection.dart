import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

import '../../features/chapter/chapter.dart';
import '../../features/manga/manga.dart';
import 'dependency_injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$registerDependencies',
  ignoreUnregisteredTypes: [
    ChapterLocalDatasource,
  ],
)
Future<void> registerDependencies() async {
  _registerHiveTypeAdapters();
  await $registerDependencies(getIt);
}

void _registerHiveTypeAdapters() {
  Hive
    ..registerAdapter<MangaDetailDto>(MangaDetailDtoAdapter())
    ..registerAdapter<ChapterItemDto>(ChapterItemDtoAdapter())
    ..registerAdapter<GenresDto>(GenresDtoAdapter())
    ..registerAdapter<ChapterDto>(ChapterDtoAdapter())
    ..registerAdapter<ChapterImageDto>(ChapterImageDtoAdapter());
}
