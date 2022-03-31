import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/core.dart';
import '../../blocs/chapter_screen/chapter_screen_cubit.dart';
import '../../widgets/loading_screen.dart';
import 'default_reading_screen.dart';

class ChapterScreen extends StatelessWidget {
  const ChapterScreen({
    Key? key,
    required this.endpoint,
  }) : super(key: key);

  static const routeName = '/chapter';
  
  final String endpoint;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocProvider<ChapterScreenCubit>(
      create: (_) => getIt<ChapterScreenCubit>()..initLoad(endpoint),
      child: BlocBuilder<ChapterScreenCubit, ChapterScreenState>(
        builder: (_, state) {
          if (state.isLoading) {
            return const LoadingScreen();
          } else if (state.chapter != null) {
            return const HorizontalReadingWidget();
            // return BlocBuilder<ChangeReadingModeBloc, ChangeReadingModeState>(
            //   builder: (_, stateReading) {
            //     if (stateReading is AdvancedReadingModeState) {
            //       return const HorizontalReadingWidget();
            //     }
            //     if (stateReading is WebtoonModeState) {
            //       return ChapterLoadedScreen(
            //         data: state.chapter,
            //         chapterList: state.mangaDetail!.listChapter,
            //         getIndexChapter: 1,
            //         openChapter: nextChapter,
            //       );
            //     }
            //     return const SizedBox.shrink();
            //   },
            // );
          }
          return const SizedBox.shrink();
        },
      ),
    );
    // });
  }
}
