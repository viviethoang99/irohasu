import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:irohasu/src/helper/hive/hive_preferences_model.dart';
import 'package:irohasu/src/models/chapter_model.dart';

import '../../../src/blocs/chapter_bloc/bloc.dart';
import '../../../src/components/loading_screen.dart';
import './chapter_loaded_screen.dart';
import './webtoon_reading_widget.dart';

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

  final _preferences = Preferences.getInstance();
  Preferences preferences;
  ReadingMode resultScreen = ReadingMode.horizontal;
  String _screenMode = 'default';

  @override
  void initState() {
    super.initState();
    _chapterBloc = BlocProvider.of<ChapterBloc>(context)
      ..add(FetchDataChapterEvent(endpoint: getEndpoint));
    _getThemeMode();
  }

  void _getThemeMode() async {
    preferences = await _preferences;
    setState(() {
      _screenMode = (preferences.getReadingMode() ?? 'default');
    });
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
          return ValueListenableBuilder(
              valueListenable:
                  Hive.box<dynamic>(Preferences.preferencesBox).listenable(),
              builder: (context, Box<dynamic> box, _) {
                _screenMode = preferences.getReadingMode();
                return _screenMode == 'default'
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
              });
        }
        return const Center(child: Text('Other states..'));
      },
    );
    // });
  }
}
