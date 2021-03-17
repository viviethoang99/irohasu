import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

//
import '../../models/chapter_model.dart';
import './webtoon_screen_widget/app_bar_widget.dart';
import './webtoon_screen_widget/bottom_bar_widget.dart';
import './webtoon_screen_widget/custom_drawer.dart';
import './webtoon_screen_widget/image_screen.dart';

class ChapterLoadedScreen extends StatefulWidget {
  const ChapterLoadedScreen({
    this.data,
    this.chapterList,
    this.getIndexChapter,
  });

  final ChapterModel data;
  final List chapterList;
  final int getIndexChapter;

  @override
  _ChapterLoadedScreenState createState() => _ChapterLoadedScreenState();
}

class _ChapterLoadedScreenState extends State<ChapterLoadedScreen> {
  List get _getChapterList => widget.chapterList.toList();

  ChapterModel get data => widget.data;
  int get getIndex => widget.getIndexChapter;

  final ScrollController _scrollController = ScrollController();
  final scrollDirection = Axis.vertical;
  ItemScrollController _scrollListController;

  @override
  void initState() {
    super.initState();
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
              LoadImage(
                scrollController: _scrollController,
                data: data,
              ),
              AppBarChapterScreen(
                endpoint: data.chapterEndpoint,
                maxWidth: constraints.maxWidth,
                getIndex: getIndex,
                scrollController: _scrollController,
              ),
              BottomBarChapterScreen(
                endpoint: data.chapterEndpoint,
                chapterList: _getChapterList,
                maxWidth: constraints.maxWidth,
                mangaDetail: data.mangaDetail,
                getIndex: getIndex,
                scrollController: _scrollController,
                scrollListController: _scrollListController,
              ),
            ],
          );
        }),
        drawer: CustomDrawer(
          scrollListController: _scrollListController,
          getIndex: getIndex,
          getChapterList: _getChapterList,
          idManga: data.mangaDetail.split('/')[4],
        ),
      ),
    );
  }
}
