import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:irohasu/src/blocs/list_manga_library_bloc/list_manga_library_bloc.dart';
import 'package:irohasu/src/models/cache_manga_model.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import './env.dart';
import './src/blocs/change_background_color_bloc/change_background_bloc.dart';
import './src/blocs/change_reading_mode_bloc/change_reading_mode_bloc.dart';
import './src/blocs/change_theme_bloc/change_theme_bloc.dart';
import './src/blocs/chapter_bloc/bloc.dart';
import './src/blocs/list_manga_bloc/bloc.dart';
import './src/blocs/manga_detail_bloc/bloc.dart';
import './src/blocs/search_bloc/bloc.dart';
import './src/helper/routes.dart';
import './src/models/chapter_item_model.dart';
import './src/models/genres_model.dart';
import './src/models/manga_detail_model.dart';
import './src/resources/chapter_repo.dart';
import './src/resources/list_manga_repo.dart';
import './src/resources/manga_detail_repo.dart';
import './src/resources/search_repo.dart';
import './src/screens/index_screen/index_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  await Hive.initFlutter(appDocumentDirectory.path);
  Hive
    ..registerAdapter<MangaDetailModel>(MangaDetailModelAdapter())
    ..registerAdapter<ChapterItem>(ChapterItemAdapter())
    ..registerAdapter<Genres>(GenresAdapter())
    ..registerAdapter<CacheMangaModel>(CacheMangaModelAdapter());
  await Hive.openBox('irohasu');
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ListMangaLibraryBloc>(
          create: (context) => ListMangaLibraryBloc(),
        ),
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
        BlocProvider<ChangeBackgroundBloc>(
          create: (context) => ChangeBackgroundBloc(),
        ),
        BlocProvider<ChangeThemeBloc>(
          create: (context) => ChangeThemeBloc(),
        ),
        BlocProvider<ChangeReadingModeBloc>(
          create: (context) => ChangeReadingModeBloc(),
        ),
      ],
      child: BlocProvider<ChangeThemeBloc>(
        create: (context) => ChangeThemeBloc()..add(DecideTheme()),
        child: BlocBuilder<ChangeThemeBloc, ChangeThemeState>(
            builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: ENV.nameApp,
            theme: state.themeLight,
            darkTheme: state.themeDark,
            home: IndexScreen(),
            initialRoute: IndexScreen.routeName,
            onGenerateRoute: generateRoute,
          );
        }),
      ),
    );
  }
}
