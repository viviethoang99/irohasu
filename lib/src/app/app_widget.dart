import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import '../../env.dart';
import '../config/routes/app_routes.dart';
import '../core/helper/remove_scroll_glow.dart';
import '../data/datasource/local/cache_manager_data.dart';
import '../data/datasource/remote/chapter_services.dart';
import '../data/repositories/chapter_repository_imp.dart';
import '../data/repositories/manga_repository_imp.dart';
import '../domain/repositories/chaper_repository.dart';
import '../domain/repositories/manga_repository.dart';
import '../presentation/blocs/change_background_color_bloc/change_background_bloc.dart';
import '../presentation/blocs/change_reading_mode_bloc/change_reading_mode_bloc.dart';
import '../presentation/blocs/change_theme_bloc/change_theme_bloc.dart';
import '../presentation/blocs/history_screen_bloc/history_screen_bloc.dart';
import '../presentation/blocs/library_screen_bloc/library_screen_bloc.dart';
import '../presentation/blocs/list_manga_bloc/list_manga_bloc.dart';
import '../presentation/blocs/manga_detail_bloc/manga_detail_bloc.dart';
import '../presentation/blocs/search_bloc/bloc.dart';
import '../presentation/screens/index_screen/index_screen.dart';

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
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<MangaRepository>(
          create: (context) => mangaRepository,
        ),
        RepositoryProvider<ChapterRepository>(
          create: (context) => chapterRepository,
        ),
      ],
      child: MultiBlocProvider(
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
            create: (_) => ChangeThemeBloc()..add(SetTheme()),
          ),
          BlocProvider<ChangeReadingModeBloc>(
            create: (context) => ChangeReadingModeBloc(),
          ),
        ],
        child: BlocBuilder<ChangeThemeBloc, ChangeThemeState>(
          builder: (_, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              scrollBehavior: CustomScrollBehavior(),
              title: ENV.nameApp,
              theme: state.themeLight,
              darkTheme: state.themeDark,
              home: const HomeScreen(),
              initialRoute: HomeScreen.routeName,
              onGenerateRoute: AppRoutes.generateRoute,
            );
          },
        ),
      ),
    );
  }
}
