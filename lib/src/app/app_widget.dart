import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import '../../env.dart';
import '../blocs/change_background_color_bloc/change_background_bloc.dart';
import '../blocs/change_reading_mode_bloc/change_reading_mode_bloc.dart';
import '../blocs/change_theme_bloc/change_theme_bloc.dart';
import '../blocs/history_screen_bloc/history_screen_bloc.dart';
import '../blocs/library_screen_bloc/library_screen_bloc.dart';
import '../blocs/list_manga_bloc/bloc.dart';
import '../blocs/manga_detail_bloc/bloc.dart';
import '../blocs/search_bloc/bloc.dart';
import '../helper/routes.dart';
import '../local/cache_manager_data.dart';
import '../repositories/chaper_repository.dart';
import '../repositories/imp/chapter_repository_imp.dart';
import '../repositories/imp/manga_repository_imp.dart';
import '../repositories/manga_repository.dart';
import '../screens/index_screen/index_screen.dart';
import '../services/chapter_services.dart';

class AppWidget extends StatefulWidget {
  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  late final MangaRepository mangaRepository;
  late final ChapterRepository chapterRepository;
  late final CacheManagerData cacheManagerData;

  @override
  void initState() {
    initLoad();
    super.initState();
  }

  Future<void> initLoad() async {
    mangaRepository = await MangaRepositoryImp.getInstance();
    chapterRepository = ChapterRepositoryImp(ChapterServices());
    cacheManagerData = CacheManagerData();
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LibraryScreenBloc>(
          create: (context) => LibraryScreenBloc(mangaRepository),
        ),
        BlocProvider<HistoryScreenBloc>(
          create: (context) => HistoryScreenBloc(mangaRepository),
        ),
        BlocProvider<MangaDetailBloc>(
          create: (context) => MangaDetailBloc(mangaRepository),
        ),
        BlocProvider<ListMangaBloc>(
          create: (context) => ListMangaBloc(mangaRepository),
        ),
        BlocProvider<SearchBloc>(
          create: (context) => SearchBloc(mangaRepository),
        ),
        BlocProvider<ChangeBackgroundBloc>(
          create: (context) => ChangeBackgroundBloc(),
        ),
        BlocProvider<ChangeThemeBloc>(
          create: (_) => ChangeThemeBloc()..add(DecideTheme()),
        ),
        BlocProvider<ChangeReadingModeBloc>(
          create: (context) => ChangeReadingModeBloc(),
        ),
      ],
      child: BlocBuilder<ChangeThemeBloc, ChangeThemeState>(
        builder: (_, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: ENV.nameApp,
            theme: state.themeLight,
            darkTheme: state.themeDark,
            home: IndexScreen(),
            initialRoute: IndexScreen.routeName,
            onGenerateRoute: generateRoute,
          );
        },
      ),
    );
  }
}
