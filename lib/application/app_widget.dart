import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/core.dart';
import '../../env.dart';
import '../../features/features.dart';
import '../config/routes/app_routes.dart';
import '../features/chapter/chapter.dart';
import '../features/download/download.dart';
import '../features/manga/manga.dart';
import '../features/shared/shared.dart';

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

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
        ),
        BlocProvider(
          create: (_) => getIt<ManageDownloadBloc>(),
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
