import 'package:flutter/material.dart';
import 'package:irohasu/src/screens/chapter_screens/widget/app_bar_widget.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../src/models/chapter_model.dart';
import 'widget/bottom_bar_widget.dart';
import 'widget/custom_drawer.dart';
import 'widget/image_screen.dart';

class ChapterLoadedScreen extends StatefulWidget {
  const ChapterLoadedScreen({this.data, this.endpoint, this.chapterList});

  final ChapterModel data;
  final String endpoint;
  final List chapterList;

  @override
  _ChapterLoadedScreenState createState() => _ChapterLoadedScreenState();
}

class _ChapterLoadedScreenState extends State<ChapterLoadedScreen> {
  String get _getEndpoint => widget.endpoint;

  List get _getChapterList => widget.chapterList.toList();

  ChapterModel get data => widget.data;

  final ScrollController _scrollController = ScrollController();
  final scrollDirection = Axis.vertical;
  ItemScrollController _scrollListController;
  int _getIndex;

  @override
  void initState() {
    super.initState();
    _getIndex = _getChapterList.indexWhere(
        (dynamic element) => element.chapterEndpoint == _getEndpoint);
    _scrollListController = ItemScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: LayoutBuilder(builder: (context, constraints) {
          return Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              LoadImage(scrollController: _scrollController, data: data),
              AppBarChapterScreen(
                endpoint: _getEndpoint,
                chapterList: _getChapterList,
                maxWidth: constraints.maxWidth,
                mangaDetail: data.mangaDetail,
                getIndex: _getIndex,
                scrollController: _scrollController,
                scrollListController: _scrollListController,
              ),
              BottomBarChapterScreen(
                endpoint: _getEndpoint,
                chapterList: _getChapterList,
                maxWidth: constraints.maxWidth,
                mangaDetail: data.mangaDetail,
                getIndex: _getIndex,
                scrollController: _scrollController,
                scrollListController: _scrollListController,
              ),
            ],
          );
        }),
        drawer: CustomDrawer(
            scrollListController: _scrollListController,
            getIndex: _getIndex,
            getChapterList: _getChapterList),
      ),
    );
  }
}

