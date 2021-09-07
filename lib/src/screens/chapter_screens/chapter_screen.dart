import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/change_reading_mode_bloc/change_reading_mode_bloc.dart';
import '../../blocs/chapter_screen/chapter_screen_cubit.dart';
import '../../blocs/manga_detail_bloc/bloc.dart';
import '../../local/history_data.dart';
import '../../repositories/imp/chapter_repository_imp.dart';
import '../../services/chapter_services.dart';
import '../../widgets/loading_screen.dart';
import 'default_reading_screen.dart';
import 'webtoon_screen.dart';

class ChapterScreen extends StatefulWidget {
  ChapterScreen({
    Key? key,
    required this.endpoint,
    required this.chapterList,
    this.titleChapter,
    this.titleManga,
    this.mangaDetail,
  }) : super(key: key);

  static const routeName = '/chapter';
  final String? titleManga;
  final String? titleChapter;
  final String? endpoint;
  final List? chapterList;
  final String? mangaDetail;

  @override
  _ChapterScreenState createState() => _ChapterScreenState();
}

class _ChapterScreenState extends State<ChapterScreen> {
  List get getChapterList => widget.chapterList!.reversed.toList();

  late final ChapterScreenCubit _cubit;

  @override
  void initState() {
    _cubit = ChapterScreenCubit(
      ChapterRepositoryImp(ChapterServices()),
      context.read<MangaDetailBloc>(),
    );
    BlocProvider.of<ChangeReadingModeBloc>(context).add(GetReadingMode());

    super.initState();
  }

  void nextChapter(int chapter) {
    HistoryData.addChapToHistory(
      idManga: widget.mangaDetail!.split('/')[4],
      idChapter: getChapterList[chapter].id,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ChapterScreenCubit>(
      create: (context) => _cubit..initLoad(widget.endpoint!),
      child: BlocBuilder<ChapterScreenCubit, ChapterScreenState>(
        builder: (context, state) {
          if (state.isLoading) {
            return LoadingScreen();
          } else if (state.chapter != null) {
            return BlocBuilder<ChangeReadingModeBloc, ChangeReadingModeState>(
                builder: (context, stateReading) {
              if (stateReading is AdvancedReadingModeState) {
                return HorizontalReadingWidget(
                  data: state.chapter,
                  chapterList: getChapterList,
                  indexChapter: 23,
                  openChapter: nextChapter,
                );
              }
              if (stateReading is WebtoonModeState) {
                return ChapterLoadedScreen(
                  data: state.chapter,
                  chapterList: getChapterList,
                  getIndexChapter: 23,
                  openChapter: nextChapter,
                );
              }
              return const SizedBox.shrink();
            });
          }
          return Scaffold(
            appBar: AppBar(),
            body: Container(),
          );
        },
      ),
    );
    // });
  }
}
