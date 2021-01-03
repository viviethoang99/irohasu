import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class AppBarChapterScreen extends StatefulWidget {
  AppBarChapterScreen(
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
  final ScrollController scrollController;
  final ItemScrollController scrollListController;
  final int getIndex;

  @override
  _AppBarChapterScreenState createState() => _AppBarChapterScreenState();
}

class _AppBarChapterScreenState extends State<AppBarChapterScreen> {
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
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      width: maxWidth,
      child: Container(
        width: double.infinity,
        height: 80,
        color: Colors.black54,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            IconButton(
                icon: const Icon(Icons.comment),
                color: Colors.green[500],
                iconSize: 39,
                onPressed: () {}),
            IconButton(
                icon: const Icon(Icons.bookmark),
                color: Colors.green[500],
                iconSize: 39,
                onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
