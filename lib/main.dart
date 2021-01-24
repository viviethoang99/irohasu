import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:irohasu/src/models/chapter_list_model.dart';
import 'package:irohasu/src/models/hive_recent_model.dart';
import 'package:irohasu/src/models/manga_model.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import './src/blocs/chapter_bloc/bloc.dart';
import './src/blocs/list_manga_bloc/bloc.dart';
import './src/blocs/manga_detail_bloc/bloc.dart';
import './src/blocs/search_bloc/bloc.dart';
import './src/constants/base_app_theme.dart';
import './src/helper/routes.dart';
import './src/resources/chapter_repo.dart';
import './src/resources/list_manga_repo.dart';
import './src/resources/manga_detail_repo.dart';
import './src/resources/search_repo.dart';
import './src/screens/index_screen/index_screen.dart';
import 'src/models/hive/hive_preferences_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  await Hive.initFlutter(appDocumentDirectory.path);
  Hive.registerAdapter<MangaModel>(MangaModelAdapter());
  Hive.registerAdapter<HiveRecentModel>(HiveRecentModelAdapter());
  Hive.registerAdapter<ChapterList>(ChapterListAdapter());
  await Hive.openBox<dynamic>(Preferences.preferencesBox);
  await Hive.openBox<MangaModel>(MangaModel.mangaBox);
  await Hive.openBox<HiveRecentModel>(HiveRecentModel.recentBox);
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectTheme = 0;
  final _preferences = Preferences.getInstance();
  Preferences preferences;
  ThemeData lightMode;
  ThemeData darkMode;

  void _checkThemeMode() async {
    preferences = await _preferences;
    setState(() {
      _selectTheme = preferences.getAppTheme() ?? 0;
    });
    _setThemeMode();
  }


  void _setThemeMode() {
    switch (_selectTheme) {
      case 0:
        setState(() {
          lightMode = appThemeData[AppTheme.white];
          darkMode = null;
        });
        break;
      case 1:
        setState(() {
          lightMode = appThemeData[AppTheme.dark];
          darkMode = null;
        });
        break;
      case 2:
        setState(() {
          lightMode = appThemeData[AppTheme.black];
          darkMode = null;
        });
        break;
      case 3:
        setState(() {
          lightMode = appThemeData[AppTheme.white];
          darkMode = appThemeData[AppTheme.dark];
        });
        break;
      case 4:
        setState(() {
          lightMode = appThemeData[AppTheme.white];
          darkMode = appThemeData[AppTheme.black];
        });
        break;
    }
  }

  @override
  void initState() {
    super.initState();
    _checkThemeMode();
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
      child: ValueListenableBuilder(
          valueListenable:
              Hive.box<dynamic>(Preferences.preferencesBox).listenable(),
          builder: (context, Box<dynamic> box, widget) {
            _checkThemeMode();
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Irohasu',
              theme: lightMode,
              darkTheme: darkMode,
              home: IndexScreen(),
              initialRoute: IndexScreen.routeName,
              onGenerateRoute: generateRoute,
            );
          }),
    );
  }
}
