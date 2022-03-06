import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/helper/size_config.dart';
import '../../../domain/repositories/chaper_repository.dart';
import '../../blocs/chapter_screen/chapter_screen_cubit.dart';
import '../../blocs/manga_detail_bloc/manga_detail_bloc.dart';
import '../../widgets/loading_screen.dart';
import 'default_reading_screen.dart';

class ChapterScreen extends StatefulWidget {
  ChapterScreen({
    Key? key,
    required this.endpoint,
  }) : super(key: key);

  static const routeName = '/chapter';
  final String? endpoint;

  @override
  _ChapterScreenState createState() => _ChapterScreenState();
}

class _ChapterScreenState extends State<ChapterScreen> {
  late final ChapterScreenCubit _cubit;

  @override
  void initState() {
    _cubit = ChapterScreenCubit(
      repository: context.read<ChapterRepository>(),
      mangaDetailBloc: context.read<MangaDetailBloc>(),
    )..initLoad(widget.endpoint!);
    // BlocProvider.of<ChangeReadingModeBloc>(context).add(GetReadingMode());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocProvider<ChapterScreenCubit>(
      create: (context) => _cubit,
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
