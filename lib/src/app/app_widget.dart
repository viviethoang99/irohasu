import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import '../../env.dart';
import '../blocs/change_background_color_bloc/change_background_bloc.dart';
import '../blocs/change_reading_mode_bloc/change_reading_mode_bloc.dart';
import '../blocs/change_theme_bloc/change_theme_bloc.dart';
import '../blocs/chapter_bloc/bloc.dart';
import '../blocs/history_bloc/history_bloc.dart';
import '../blocs/list_manga_bloc/bloc.dart';
import '../blocs/list_manga_library_bloc/list_manga_library_bloc.dart';
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
import '../services/manga_services.dart';

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
    mangaRepository = MangaRepositoryImp(MangaService());
    chapterRepository = ChapterRepositoryImp(ChapterServices());
    cacheManagerData = CacheManagerData();
    super.initState();
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
        BlocProvider<ListMangaLibraryBloc>(
          create: (context) => ListMangaLibraryBloc(),
        ),
        BlocProvider<HistoryBloc>(
          create: (context) => HistoryBloc(),
        ),
        BlocProvider<MangaDetailBloc>(
          create: (context) => MangaDetailBloc(
            mangaRepository,
            cacheManagerData,
          ),
        ),
        BlocProvider<ListMangaBloc>(
          create: (context) => ListMangaBloc(mangaRepository),
        ),
        BlocProvider<ChapterBloc>(
          create: (context) => ChapterBloc(chapterRepository),
        ),
        BlocProvider<SearchBloc>(
          create: (context) => SearchBloc(mangaRepository),
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
