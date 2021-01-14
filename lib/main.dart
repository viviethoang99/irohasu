import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import './src/blocs/chapter_bloc/bloc.dart';
import './src/blocs/list_manga_bloc/bloc.dart';
import './src/blocs/manga_detail_bloc/bloc.dart';
import './src/blocs/search_bloc/bloc.dart';
import './src/helper/hive/hive_chapter_opened_model.dart';
import './src/helper/hive/hive_setting_model.dart';
import './src/helper/routes.dart';
import './src/resources/chapter_repo.dart';
import './src/resources/list_manga_repo.dart';
import './src/resources/manga_detail_repo.dart';
import './src/resources/search_repo.dart';
import './src/screens/home_screens/home_screen.dart';

const settingChapterBox = 'settingChapter';
const chapterOpened = 'settingChapter';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  await Hive.initFlutter(appDocumentDirectory.path);
  await Hive.openBox<String>(settingChapterBox);
  await Hive.openBox<String>(chapterOpened);
  Hive.registerAdapter(HiveChapterOpenedModelAdapter());
  Hive.registerAdapter(HiveSettingModelAdapter());
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MangaDetailBloc>(
          create: (context) => MangaDetailBloc(MangaDetailRepo()),
        ),
        BlocProvider<ListMangaBloc>(
          create: (context) => ListMangaBloc(ListMangaRepo()),
        ),
        BlocProvider<ChapterBloc>(
          create: (context) => ChapterBloc(ChapterRepo()),
        ),
        BlocProvider<SearchBloc>(
          create: (context) => SearchBloc(SearchRepo()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Irohasu',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'OpenSans',
        ),
        home: HomeScreen(),
        initialRoute: HomeScreen.routeName,
        onGenerateRoute: generateRoute,
      ),
    );
  }
}
