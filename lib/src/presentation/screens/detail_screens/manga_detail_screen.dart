import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/core.dart';
import '../../blocs/favorite_manga_detail_bloc/favorite_manga_detail_bloc.dart';
import '../../blocs/manga_detail_bloc/manga_detail_bloc.dart';
import '../../widgets/loading_screen.dart';
import 'manga_detail_loaded_screen.dart';

class MangaDetailScreen extends StatelessWidget {
  const MangaDetailScreen({
    Key? key,
    required this.endpoint,
  }) : super(key: key);

  static const routeName = '/mangaDetail';
  final String endpoint;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MangaDetailBloc>(
          create: (_) => getIt<MangaDetailBloc>(param1: endpoint)
            ..add(FetchMangaDetailEvent()),
        ),
        BlocProvider<FavoriteMangaDetailBloc>(
          create: (_) => getIt<FavoriteMangaDetailBloc>(param1: endpoint)
            ..add(GetStatusFavoriteManga()),
        ),
      ],
      child: BlocConsumer<MangaDetailBloc, MangaDetailState>(
        listenWhen: (pre, cur) => pre.runtimeType != cur.runtimeType,
        listener: (_, state) {
          if (state is MangaDetailFailureState) {
            Navigator.of(context).pop();
          }
        },
        builder: (_, state) {
          if (state is MangaDetailLoadingState) {
            return const LoadingScreen();
          }
          if (state is MangaDetailSuccessState) {
            return MangaDetailLoadedScreen(data: state.mangaDetail);
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
