import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import '../../core/core.dart';
import '../../env.dart';
import '../../features/features.dart';
import '../config/routes/app_routes.dart';
import '../presentation/blocs/change_background_color_bloc/change_background_bloc.dart';
import '../presentation/blocs/change_reading_mode_bloc/change_reading_mode_bloc.dart';
import '../presentation/blocs/change_theme_bloc/change_theme_bloc.dart';
import '../presentation/blocs/list_manga_bloc/list_manga_bloc.dart';
import '../presentation/blocs/manage_favorite_manga/manage_favorite_manga_bloc.dart';
import '../presentation/screens/index_screen/index_screen.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  State<AppWidget> createState() => _AppWidgetState();
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
        BlocProvider<ListMangaBloc>(
          create: (_) => getIt<ListMangaBloc>(),
        ),
        BlocProvider<ChangeBackgroundBloc>(
          create: (_) => getIt<ChangeBackgroundBloc>(),
        ),
        BlocProvider<ChangeThemeBloc>(
          create: (_) => getIt<ChangeThemeBloc>()..add(GetTheme()),
        ),
        BlocProvider(
          create: (_) => getIt<ChangeReadingModeBloc>(),
        ),
        BlocProvider(
          create: (_) => getIt<ManageFavoriteMangaBloc>(),
        ),
        BlocProvider(
          create: (_) => getIt<UpdateAppCubit>(),
        )
      ],
      child: BlocBuilder<ChangeThemeBloc, ChangeThemeState>(
        builder: (_, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            scrollBehavior: CustomScrollBehavior(),
            title: ENV.nameApp,
            theme: state.themeLight,
            darkTheme: state.themeDark,
            initialRoute: HomeScreen.routeName,
            onGenerateRoute: AppRoutes.generateRoute,
          );
        },
      ),
    );
  }
}
