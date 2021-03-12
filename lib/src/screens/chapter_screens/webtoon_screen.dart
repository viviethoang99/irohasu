import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

//
import '../../models/chapter_model.dart';
import './webtoon_screen_widget/app_bar_widget.dart';
import './webtoon_screen_widget/bottom_bar_widget.dart';
import './webtoon_screen_widget/custom_drawer.dart';
import './webtoon_screen_widget/image_screen.dart';

class ChapterLoadedScreen extends StatefulWidget {
  const ChapterLoadedScreen(
      {this.data, this.endpoint, this.chapterList});

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
                maxWidth: constraints.maxWidth,
                getIndex: _getIndex,
                scrollController: _scrollController,
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
          getChapterList: _getChapterList,
        ),
      ),
    );
  }
}
