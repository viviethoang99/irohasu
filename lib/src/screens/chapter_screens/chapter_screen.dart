import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:irohasu/src/service/history_data.dart';

import '../../blocs/change_reading_mode_bloc/change_reading_mode_bloc.dart';
import '../../blocs/chapter_bloc/bloc.dart';
import '../../components/loading_screen.dart';

import './default_reading_screen.dart';
import './webtoon_screen.dart';

class ChapterScreen extends StatefulWidget {
  ChapterScreen({
    Key key,
    @required this.endpoint,
    @required this.chapterList,
    this.titleChapter,
    this.titleManga,
    this.mangaDetail,
  }) : super(key: key);

  static const routeName = '/chapter';
  final String titleManga;
  final String titleChapter;
  final String endpoint;
  final List chapterList;
  final String mangaDetail;

  @override
  _ChapterScreenState createState() => _ChapterScreenState();
}

class _ChapterScreenState extends State<ChapterScreen> {
  String get getEndpoint => widget.endpoint;
  int getIndexChapter;

  List get getChapterList => widget.chapterList.reversed.toList();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ChangeReadingModeBloc>(context).add(GetReadingMode());
    getIndexChapter = getIndex(getEndpoint);
    _checkFetchData(getIndexChapter);
  }

  int getIndex(String endpoint) => getChapterList
      .indexWhere((element) => element.chapterEndpoint == endpoint);

  void _checkFetchData(int index) {
    if (getChapterList[index].isDownload == null) {
      BlocProvider.of<ChapterBloc>(context)
        ..add(FetchDataChapterEvent(
          endpoint: getChapterList[index].chapterEndpoint,
        ));
    } else {
      BlocProvider.of<ChapterBloc>(context)
        ..add(FetchDataDownloadEvent(
          item: getChapterList[index],
          titleManga: widget.titleManga,
          mangaDetail: widget.mangaDetail,
        ));
    }
  }

  void nextChapter(int chapter) {
    HistoryData.addChapToHistory(
      idManga: widget.mangaDetail.split('/')[4],
      idChapter: getChapterList[chapter].idChapter,
    );
    _checkFetchData(chapter);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChapterBloc, ChapterState>(
      builder: (context, state) {
        if (state is InitialChapterState) {
          return const Center(
            child: Text('Waiting!'),
          );
        }
        if (state is ChapterLoadingState) {
          return LoadingScreen();
        }
        if (state is ChapterLoadedState) {
          return BlocBuilder<ChangeReadingModeBloc, ChangeReadingModeState>(
              builder: (context, stateReading) {
            if (stateReading is AdvancedReadingModeState) {
              return HorizontalReadingWidget(
                data: state.data,
                chapterList: getChapterList,
                indexChapter: getIndex(state.data.chapterEndpoint),
                openChapter: nextChapter,
              );
            }
            if (stateReading is WebtoonModeState) {
              return ChapterLoadedScreen(
                data: state.data,
                chapterList: getChapterList,
                getIndexChapter: getIndex(state.data.chapterEndpoint),
                openChapter: nextChapter,
              );
            }
            return Container();
          });
        }
        if (state is ChapterFailureState) {
          Navigator.of(context).pop();
        }
        return const Center(child: Text('Other states..'));
      },
    );
    // });
  }
}
