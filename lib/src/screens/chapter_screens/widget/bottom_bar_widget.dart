import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../detail_screens/manga_detail_screen.dart';
import '../chapter_screen.dart';

class BottomBarChapterScreen extends StatefulWidget {
  BottomBarChapterScreen(
      {this.endpoint,
      this.chapterList,
      this.maxWidth,
      this.mangaDetail,
      this.scrollController,
      this.getIndex,
      this.scrollListController});

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

  double get maxWidth => widget.maxWidth;

  List get _getChapterList => widget.chapterList;

  String get _mangaDetail => widget.mangaDetail;

  ScrollController get _scrollController => widget.scrollController;

  int get _getIndex => widget.getIndex;

  ItemScrollController get _scrollListController => widget.scrollListController;

  @override
  void initState() {
    super.initState();
    _offset = 0;
    _scrollController.addListener(() {
      setState(() {
        var offset = _scrollController.offset;
        _delta += (offset - _oldOffset);
        if (_delta > _containerMaxHeight)
          _delta = _containerMaxHeight;
        else if (_delta < 0) _delta = 0;
        _oldOffset = offset;
        _offset = -_delta;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: _offset,
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
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    ChapterScreen.routeName,
                    arguments: ChapterScreen(
                      endpoint: _getChapterList[_getIndex - 1]
                          .chapterEndpoint
                          .toString(),
                      chapterList: _getChapterList,
                    ),
                  );
                }),
            IconButton(
              icon: const Icon(Icons.home),
              color: Colors.black87,
              iconSize: 35,
              onPressed: () {
                Navigator.of(context).pushNamed(MangaDetailScreen.routeName,
                    arguments: _mangaDetail);
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
              onPressed: () {
                Navigator.of(context).pushNamed(
                  ChapterScreen.routeName,
                  arguments: ChapterScreen(
                    endpoint: _getChapterList[_getIndex + 1]
                        .chapterEndpoint
                        .toString(),
                    chapterList: _getChapterList,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
