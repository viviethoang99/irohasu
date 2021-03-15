import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

import './env.dart';
import './src/app/app_widget.dart';
import './src/models/cache_manga_model.dart';
import './src/models/chapter_item_model.dart';
import './src/models/genres_model.dart';
import './src/models/manga_detail_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter((await getApplicationDocumentsDirectory()).path);

  Hive
    ..registerAdapter<MangaDetailModel>(MangaDetailModelAdapter())
    ..registerAdapter<ChapterItem>(ChapterItemAdapter())
    ..registerAdapter<Genres>(GenresAdapter())
    ..registerAdapter<CacheMangaModel>(CacheMangaModelAdapter());

  await Hive.openBox(ENV.nameDatabase);

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(AppWidget()));
}
