import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/change_reading_mode_bloc/change_reading_mode_bloc.dart';
import '../../blocs/chapter_bloc/bloc.dart';
import '../../components/loading_screen.dart';

import './default_reading_screen.dart';
import './webtoon_screen.dart';

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
  String get getEndpoint => widget.endpoint;

  List get getChapterList => widget.chapterList.reversed.toList();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ChapterBloc>(context)
      ..add(FetchDataChapterEvent(endpoint: getEndpoint));
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
                endpoint: state.data.chapterEndpoint,
              );
            }
            if (stateReading is WebtoonModeState) {
              return ChapterLoadedScreen(
                data: state.data,
                chapterList: getChapterList,
                endpoint: state.data.chapterEndpoint,
              );
            }
            return Container();
          });
        }
        if(state is ChapterFailureState) {
          Navigator.of(context).pop();
        }
        return const Center(child: Text('Other states..'));
      },
    );
    // });
  }
}
