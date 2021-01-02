import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:irohasu/src/blocs/search_bloc/bloc.dart';
import 'package:irohasu/src/resources/search_repo.dart';

import './src/blocs/chapter_bloc/bloc.dart';
import './src/blocs/list_manga_bloc/bloc.dart';
import './src/blocs/manga_detail_bloc/bloc.dart';
import './src/helper/routes.dart';
import './src/resources/chapter_repo.dart';
import './src/resources/list_manga_repo.dart';
import './src/resources/manga_detail_repo.dart';
import './src/ui/home_screens/recent_screen.dart';

void main() {
  runApp(MyApp());
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
        home: RecentScreen(),
        initialRoute: RecentScreen.routeName,
        onGenerateRoute: generateRoute,
      ),
    );
  }
}
