import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:irohasu/src/constants/base_blogtruyen.dart';
import '../../../src/blocs/chapter_bloc/bloc.dart';

class ChapterScreen extends StatefulWidget {
  const ChapterScreen({Key key, this.endpoint}) : super(key: key);

  static const routeName = '/chapter';
  final String endpoint;

  @override
  _ChapterScreenState createState() => _ChapterScreenState();
}

class _ChapterScreenState extends State<ChapterScreen> {
  ChapterBloc _chapterBloc;
  String get endpoint => widget.endpoint;

  @override
  void initState() {
    super.initState();
    _chapterBloc = BlocProvider.of<ChapterBloc>(context)
      ..add(FetchDataChapterEvent(endpoint: endpoint));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChapterBloc, ChapterState>(
      builder: (context, state) {
        if (state is ChapterLoadingState) {
          return Container(
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        if (state is InitialChapterState) {
          return const Center(
            child: Text('Sai cmnr'),
          );
        }
        if (state is ChapterLoadedState) {
          return Scaffold(
            body: Container(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Image.network(
                    state.data.listImageChapter[index].chapterImageLink,
                    headers: BlogTruyen.headersBuilder,
                  );
                },
                itemCount: state.data.listImageChapter.length,
              ),
            ),
          );
        }
        return const Center(child: Text('Other states..'));
      },
    );
  }
}
