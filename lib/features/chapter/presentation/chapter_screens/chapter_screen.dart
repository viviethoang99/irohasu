import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/core.dart';

import '../../../shared/shared.dart';
import '../../chapter.dart';
import '../horizontal/horizontal_screen.dart';

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
            return const HorizontalScreen();
          }
          return const SizedBox.shrink();
        },
      ),
    );
    // });
  }
}
