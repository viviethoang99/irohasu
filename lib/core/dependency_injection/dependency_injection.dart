import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

import '../../features/manga/manga.dart';
import 'dependency_injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
Future<void> configureDependencies() async {
  _registerHiveTypeAdapters();
  await getIt.init();
}

void _registerHiveTypeAdapters() {
  Hive
    ..registerAdapter<MangaDetailDto>(MangaDetailDtoAdapter())
    ..registerAdapter<ChapterItemDto>(ChapterItemDtoAdapter())
    ..registerAdapter<GenresDto>(GenresDtoAdapter());
}
