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
import '../resources/chapter_repo.dart';
import '../resources/list_manga_repo.dart';
import '../resources/manga_detail_repo.dart';
import '../resources/search_repo.dart';
import '../screens/index_screen/index_screen.dart';



class AppWidget extends StatefulWidget {
  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
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