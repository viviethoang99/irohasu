import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:irohasu/src/screens/chapter_screens/setting_chapter.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../constants/base_blogtruyen.dart';
import '../../helper/media_query_helper.dart';
import '../../models/chapter_model.dart';
import '../../models/hive/hive_preferences_model.dart';
import '../../screens/detail_screens/manga_detail_screen.dart';

import './chapter_screen.dart';
import './webtoon_widget/drawer_widget.dart';

typedef AnimationListener = void Function();

class HorizontalReadingWidget extends StatefulWidget {
  const HorizontalReadingWidget({this.data, this.endpoint, this.chapterList});

  final ChapterModel data;
  final String endpoint;
  final List chapterList;

  @override
  _HorizontalReadingWidgetState createState() =>
      _HorizontalReadingWidgetState();
}

class _HorizontalReadingWidgetState extends State<HorizontalReadingWidget>
    with TickerProviderStateMixin {
  String get _getEndpoint => widget.endpoint;

  List get _getChapterList => widget.chapterList.toList();

  ChapterModel get data => widget.data;

  String _colorTheme = 'white';
  final _preferences = Preferences.getInstance();
  Preferences preferences;

  void _checkBackgroundMode() async {
    preferences = await _preferences;
    setState(() {
      _colorTheme = preferences.getBackgroundColorChapter() ?? 'white';
    });
  }

  @override
  void initState() {
    super.initState();
    _checkBackgroundMode();
    _getIndex = _getChapterList.indexWhere(
        (dynamic element) => element.chapterEndpoint == _getEndpoint);
    _scrollListController = ItemScrollController();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _pageController = PageController(initialPage: currentIndex);
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;
    final prePage = widthScreen * 0.3;
    final nextPage = widthScreen * 0.7;
    return ValueListenableBuilder(
        valueListenable:
            Hive.box<dynamic>(Preferences.preferencesBox).listenable(),
        builder: (context, Box<dynamic> box, _) {
          // _colorTheme = box.getBackgroundColorChapter();
          return Scaffold(
            backgroundColor:
                _colorTheme == 'white' ? Colors.white : Colors.black87,
            body: LayoutBuilder(builder: (context, constraints) {
              return GestureDetector(
                onTapDown: (TapDownDetails details) {
                  var position = details.globalPosition.dx;
                  if (position <= prePage) {
                    (currentIndex == 0 && _getIndex != 0)
                        ? nextChapter(context, _getIndex - 1)
                        : _pageController.previousPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn);
                  } else if (position >= prePage && position <= nextPage) {
                    setState(() => _showMenu = !_showMenu);
                  } else {
                    currentIndex == data.listImageChapter.length - 1
                        ? nextChapter(context, _getIndex + 1)
                        :  _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn);
                  }
                },
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: <Widget>[
                    // Load image
                    _imageWidget(),
                    if (_showMenu)
                      Positioned(
                        top: 0,
                        width: ScreenHelper.getWidth(context),
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: AppBar(
                            leading: IconButton(
                              icon: const Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                              onPressed: () => btnMangaDetail,
                            ),
                            centerTitle: false,
                            backgroundColor: Colors.black.withOpacity(0.8),
                            elevation: 0,
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  data.title.length > 25
                                      ? '${data.title.substring(0, 25)}..'
                                      : data.title,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                Text(
                                  _getChapterList[_getIndex]
                                      .chapterTitle
                                      .toString(),
                                  style: const TextStyle(color: Colors.grey),
                                ),
                                const SizedBox(height: 10)
                              ],
                            ),
                            actions: <Widget>[
                              IconButton(
                                icon: const Icon(
                                  Icons.settings,
                                  size: 35,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  Navigator.of(context)
                                      .pushNamed(SettingChapter.routeName);
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                    if (_showMenu)
                      DrawerHorizontalWidget(
                        indexChapter: _getIndex,
                        indexPage: currentIndex,
                        listChapter: _getChapterList,
                        height: MediaQuery.of(context).size.height,
                        totalImage: data.listImageChapter.length,
                        scrollListController: _scrollListController,
                      ),
                  ],
                ),
              );
            }),
          );
        });
  }

  Widget _imageWidget() {
    return ExtendedImageGesturePageView.builder(
      itemCount: data.listImageChapter.length,
      scrollDirection: Axis.horizontal,
      controller: _pageController,
      itemBuilder: (context, i) {
        return ExtendedImage.network(
          data.listImageChapter[i].chapterImageLink,
          cache: true,
          headers: BlogTruyen.headersBuilder,
          onDoubleTap: (state) {
            Offset pointerDownPosition;
            pointerDownPosition = state.pointerDownPosition;
            final begin = state.gestureDetails.totalScale;
            double end;

            _animation?.removeListener(_animationListener);
            _animationController
              ..stop()
              ..reset();

            (begin == 1.0) ? end = 2.0 : end = 1.0;

            _animationListener = () {
              state.handleDoubleTap(
                  scale: _animation.value,
                  doubleTapPosition: pointerDownPosition);
            };

            _animation = _animationController
                .drive(Tween<double>(begin: begin, end: end));
            _animationController
              ..addListener(_animationListener)
              ..forward();
          },
          mode: ExtendedImageMode.gesture,
          initGestureConfigHandler: (state) => GestureConfig(
            minScale: 0.9,
            animationMinScale: 0.7,
            maxScale: 3.0,
            animationMaxScale: 3.5,
            speed: 1.0,
            inertialSpeed: 100.0,
            initialScale: 1.0,
            inPageView: true,
            cacheGesture: false,
          ),
        );
      },
      onPageChanged: (value) {
        setState(() => currentIndex = value);
      },
      physics: const BouncingScrollPhysics(),
    );
  }

  void nextChapter(BuildContext context, int chapter) {
    Navigator.of(context).pushNamed(
      ChapterScreen.routeName,
      arguments: ChapterScreen(
        endpoint: _getChapterList[chapter].chapterEndpoint.toString(),
        chapterList: _getChapterList,
      ),
    );
  }

  void btnMangaDetail(BuildContext context) {
    Navigator.of(context).pushNamed(MangaDetailScreen.routeName,
        arguments: widget.data.mangaDetail);
  }

  ItemScrollController _scrollListController;
  int _getIndex;
  Animation<double> _animation;
  AnimationController _animationController;
  AnimationListener _animationListener;
  int currentIndex = 0;
  bool _showMenu = false;
  PageController _pageController;
}
