import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/core.dart';
import '../../../data/model/chapter_screen/chapter_screen_params.dart';
import '../../blocs/chapter_screen/chapter_screen_cubit.dart';
import '../../blocs/manga_info_bloc/manga_info_cubit.dart';
import '../../widgets/loading_screen.dart';
import 'default_reading_screen.dart';

class ChapterScreen extends StatelessWidget {
  const ChapterScreen({
    Key? key,
    required this.data,
  }) : super(key: key);

  static const routeName = '/chapterScreen';

  final ChapterScreenParams data;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider<ChapterScreenCubit>(
          create: (_) => getIt<ChapterScreenCubit>()..initLoad(data.endpoint),
        ),
        BlocProvider<MangaInfoCubit>(
          create: (_) => MangaInfoCubit(data),
        ),
      ],
      child: BlocBuilder<ChapterScreenCubit, ChapterScreenState>(
        builder: (_, state) {
          if (state.isLoading) {
            return const LoadingScreen();
          } else if (state.chapter != null) {
            return const HorizontalReadingWidget();
          }
          return const SizedBox.shrink();
        },
      ),
    );
    // });
  }
}
