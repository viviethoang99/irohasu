import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../src/blocs/chapter_bloc/bloc.dart';
import '../../../src/components/loading_screen.dart';
import './chapter_loaded_screen.dart';
import './horizontal_reading_widget.dart';

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

  final Future<SharedPreferences> _pref = SharedPreferences.getInstance();

  void checkReadingMode() async {
    pref = await _pref;
    if (pref.getBool('isHorizontal') == true) {
      setState(() {
        _isHorizontal = true;
      });
    } else {
      setState(() {
        _isHorizontal = false;
      });
    }
  }

  void changeReadingMode() {
    setState(() {
      _isHorizontal = !_isHorizontal;
    });
  }

  @override
  void initState() {
    super.initState();
    checkReadingMode();
    _chapterBloc = BlocProvider.of<ChapterBloc>(context)
      ..add(FetchDataChapterEvent(endpoint: getEndpoint));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChapterBloc, ChapterState>(
      builder: (context, state) {
        if (state is ChapterLoadingState) {
          return LoadingScreen();
        }
        if (state is InitialChapterState) {
          return const Center(
            child: Text('Waiting!'),
          );
        }
        if (state is ChapterLoadedState) {
          return _isHorizontal
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
  }

  SharedPreferences pref;
  bool _isHorizontal = false;
}
