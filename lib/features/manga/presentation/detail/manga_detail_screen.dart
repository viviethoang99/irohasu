import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/core.dart';
import '../../../download/download.dart';
import '../../manga.dart';
import 'model/manga_detail_screen_params.dart';
import 'state/state.dart';

class MangaDetailScreen extends StatelessWidget {
  const MangaDetailScreen({
    Key? key,
    required this.params,
  }) : super(key: key);

  static const routeName = '/mangaDetail';

  final MangaDetailScreenParams params;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider<MangaDetailBloc>(
          create: (_) => getIt<MangaDetailBloc>(param1: params)
            ..add(FetchMangaDetailEvent()),
        ),
        BlocProvider<FavoriteMangaDetailBloc>(
          create: (_) => getIt<FavoriteMangaDetailBloc>(param1: params.endpoint)
            ..add(GetStatusFavoriteManga()),
        ),
        BlocProvider(
          create: (_) => getIt<DownloadMangaCubit>(param1: params.endpoint.toId)
            ..watchManga(),
        )
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
            return MangaDetailLoading(params: params);
          }
          if (state is MangaDetailSuccessState) {
            return MangaDetailLoaded(data: state.mangaDetail);
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
