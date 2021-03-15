import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../blocs/chapter_bloc/bloc.dart';
import '../../../service/history_data.dart';

class BottomBarChapterScreen extends StatefulWidget {
  BottomBarChapterScreen({
    this.endpoint,
    this.chapterList,
    this.maxWidth,
    this.mangaDetail,
    this.scrollController,
    this.getIndex,
    this.scrollListController,
  });

  final String mangaDetail;
  final String endpoint;
  final List chapterList;
  final double maxWidth;
  final int getIndex;
  final ScrollController scrollController;
  final ItemScrollController scrollListController;

  @override
  _BottomBarChapterScreenState createState() => _BottomBarChapterScreenState();
}

class _BottomBarChapterScreenState extends State<BottomBarChapterScreen> {
  double _offset, _delta = 0, _oldOffset = 0;
  final double _containerMaxHeight = 56;
  bool hasReachedEnd = false;

  double get maxWidth => widget.maxWidth;

  List get _getChapterList => widget.chapterList;

  ScrollController get _scrollController => widget.scrollController;

  int get _getIndex => widget.getIndex;

  ItemScrollController get _scrollListController => widget.scrollListController;

  @override
  void initState() {
    super.initState();
    _offset = 0;
    _scrollController
      ..addListener(() {
        setState(() {
          var offset = _scrollController.offset;
          _delta += (offset - _oldOffset);
          if (_delta > _containerMaxHeight)
            _delta = _containerMaxHeight;
          else if (_delta < 0) _delta = 0;
          _oldOffset = offset;
          _offset = -_delta;
        });
      })
      ..addListener(() {
        final maxScrollExtent = _scrollController.position.maxScrollExtent;
        final currentScroll = _scrollController.position.pixels;
        if (maxScrollExtent - currentScroll == 0) {
          hasReachedEnd = true;
        } else {
          hasReachedEnd = false;
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: hasReachedEnd ? 0 : _offset,
      width: maxWidth,
      child: Container(
        width: double.infinity,
        height: _containerMaxHeight,
        color: Colors.grey[300],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
                icon: const Icon(Icons.skip_previous),
                color: Colors.black87,
                iconSize: 35,
                onPressed: _getIndex != 0
                    ? () => nextChapter(context, _getIndex -1)
                    : null),
            IconButton(
              icon: const Icon(Icons.home),
              color: Colors.black87,
              iconSize: 35,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            IconButton(
              icon: const Icon(Icons.view_list),
              color: Colors.black87,
              iconSize: 35,
              onPressed: () {
                Scaffold.of(context).openDrawer();
                SchedulerBinding.instance.addPostFrameCallback((_) {
                  _scrollListController.jumpTo(
                      index: _getIndex, alignment: 0.5);
                });
              },
            ),
            IconButton(
              icon: const Icon(Icons.skip_next),
              color: Colors.black87,
              iconSize: 35,
              onPressed: (_getIndex != _getChapterList.length - 1)
                  ? () => nextChapter(context, _getIndex + 1)
                  : null,
            ),
          ],
        ),
      ),
    );
  }

  void nextChapter(BuildContext context, int chapter) {
    HistoryData.addChapToHistory(
      idManga: widget.mangaDetail.split('/')[4],
      idChapter: _getChapterList[chapter].idChapter,
    );
    BlocProvider.of<ChapterBloc>(context)
      ..add(FetchDataChapterEvent(
          endpoint: _getChapterList[chapter].chapterEndpoint));
  }
}
