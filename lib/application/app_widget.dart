import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/core.dart';
import '../../env.dart';
import '../../features/features.dart';
import '../config/routes/app_routes.dart';
import '../features/chapter/chapter.dart';
import '../features/manga/manga.dart';
import '../features/shared/shared.dart';

class Application extends StatelessWidget {
  const Application({super.key});

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
        BlocProvider<AppearanceCubit>(
          create: (_) => getIt<AppearanceCubit>(),
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
      child: BlocBuilder<AppearanceCubit, AppearanceState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            scrollBehavior: CustomScrollBehavior(),
            title: ENV.nameApp,
            darkTheme: state.darkTheme,
            themeMode: state.themeMode,
            theme: state.lightTheme,
            initialRoute: HomeScreen.routeName,
            onGenerateRoute: AppRoutes.generateRoute,
          );
        },
      ),
    );
  }
}
