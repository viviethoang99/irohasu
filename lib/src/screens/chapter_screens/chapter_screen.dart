import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../src/blocs/chapter_bloc/bloc.dart';
import '../../../src/components/loading_screen.dart';
import './chapter_loaded_screen.dart';
import 'webtoon_reading_widget.dart';

class ChapterScreen extends StatefulWidget {
  ChapterScreen({Key key, @required this.endpoint, @required this.chapterList})
      : super(key: key);

  static const routeName = '/chapter';
  final String endpoint;
  final List chapterList;

  @override
  _ChapterScreenState createState() => _ChapterScreenState();
}

class _ChapterScreenState extends State<ChapterScreen> {
  ChapterBloc _chapterBloc;

  String get getEndpoint => widget.endpoint;

  List get getChapterList => widget.chapterList.reversed.toList();

  var settingChapter = Hive.box<String>('settingChapter');
  ReadingMode resultScreen;

  @override
  void initState() {
    super.initState();
    _chapterBloc = BlocProvider.of<ChapterBloc>(context)
      ..add(FetchDataChapterEvent(endpoint: getEndpoint));
  }

  ReadingMode readingMode(String mode) {
    switch (mode) {
      case 'horizontal':
        resultScreen = ReadingMode.horizontal;
        break;
      case 'vertical':
        resultScreen = ReadingMode.vertical;
    }
    return resultScreen;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: settingChapter.listenable(),
        builder: (context, Box<String> box, _) {
          resultScreen =
              readingMode(box.get('screenMode', defaultValue: 'horizontal'));
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
                return resultScreen == ReadingMode.horizontal
                    ? HorizontalReadingWidget(
                        data: state.data,
                        chapterList: getChapterList,
                        endpoint: getEndpoint,
                      )
                    : ChapterLoadedScreen(
                        data: state.data,
                        chapterList: getChapterList,
                        endpoint: getEndpoint,
                      );
              }
              return const Center(child: Text('Other states..'));
            },
          );
        });
  }
}
